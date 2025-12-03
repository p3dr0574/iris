<?php

class CustomersForm extends TPage
{
    protected BootstrapFormBuilder $form;
    private $formFields = [];
    private static $database = 'gestao';
    private static $activeRecord = 'Customers';
    private static $primaryKey = 'id';
    private static $formName = 'form_CustomersForm';

    /**
     * Form constructor
     * @param $param Request
     */
    public function __construct( $param )
    {
        parent::__construct();

        if(!empty($param['target_container']))
        {
            $this->adianti_target_container = $param['target_container'];
        }

        // creates the form
        $this->form = new BootstrapFormBuilder(self::$formName);
        // define the form title
        $this->form->setFormTitle("Clientes");

        $criteria_address_id = new TCriteria();

        $name = new TEntry('name');
        $id = new THidden('id');
        $cnae = new TEntry('cnae');
        $cnpj = new TEntry('cnpj');
        $address_id = new TDBCombo('address_id', 'gestao', 'Address', 'id', '{rua} - {cep}','id asc' , $criteria_address_id );
        $button_cadastrar = new TButton('button_cadastrar');
        $website = new TEntry('website');
        $email = new TEntry('email');

        $name->addValidation("Name", new TRequiredValidator()); 
        $cnpj->addValidation("Cnpj", new TRequiredValidator()); 
        $address_id->addValidation("Address id", new TRequiredValidator()); 

        $address_id->enableSearch();
        $address_id->configureNoResultsCreateButton(new TAction(['AddressForm', 'onShow']), "Cadastrar", " ", "btn-default");
        $button_cadastrar->setAction(new TAction([$this, 'onRefreshEndereco']), "Cadastrar");
        $button_cadastrar->addStyleClass('btn-default');
        $button_cadastrar->setImage('fas:plus #009688');
        $cnpj->setMaxLength(25);
        $name->setMaxLength(255);
        $email->setMaxLength(255);
        $website->setMaxLength(255);

        $id->setSize(200);
        $name->setSize('100%');
        $cnae->setSize('100%');
        $cnpj->setSize('100%');
        $email->setSize('100%');
        $website->setSize('100%');
        $address_id->setSize('70%');

        $row1 = $this->form->addFields([new TLabel("Nome:", '#ff0000', '14px', null, '100%'),$name,$id],[new TLabel("CNAE:", null, '14px', null, '100%'),$cnae]);
        $row1->layout = ['col-sm-6','col-sm-6'];

        $row2 = $this->form->addFields([new TLabel("CNPJ:", '#ff0000', '14px', null, '100%'),$cnpj],[new TLabel("Endereço:", '#ff0000', '14px', null, '100%'),$address_id,$button_cadastrar]);
        $row2->layout = ['col-sm-6',' col-sm-6'];

        $row3 = $this->form->addFields([new TLabel("Website:", null, '14px', null, '100%'),$website],[new TLabel("Email:", null, '14px', null, '100%'),$email]);
        $row3->layout = ['col-sm-6','col-sm-6'];

        // create the form actions
        $btn_onsave = $this->form->addAction("Salvar", new TAction([$this, 'onSave']), 'fas:save #ffffff');
        $this->btn_onsave = $btn_onsave;
        $btn_onsave->addStyleClass('btn-primary'); 

        $btn_onclear = $this->form->addAction("Limpar formulário", new TAction([$this, 'onClear']), 'fas:eraser #dd5a43');
        $this->btn_onclear = $btn_onclear;

        parent::setTargetContainer('adianti_right_panel');

        $btnClose = new TButton('closeCurtain');
        $btnClose->class = 'btn btn-sm btn-default';
        $btnClose->style = 'margin-right:10px;';
        $btnClose->onClick = "Template.closeRightPanel();";
        $btnClose->setLabel("Fechar");
        $btnClose->setImage('fas:times');

        $this->form->addHeaderWidget($btnClose);

        parent::add($this->form);

        $style = new TStyle('right-panel > .container-part[page-name=CustomersForm]');
        $style->width = '70% !important';   
        $style->show(true);

    }

    public static function onRefreshEndereco($param = null) 
    {
        try 
        {
            AdiantiCoreApplication::loadPage('AddressForm', 'onShow', []);

            // TDBCombo::reloadFromModel(self::$formName, 'address_id', 'gestao', 'Address', 'id', '{cep} - {rua}');

        }
        catch (Exception $e) 
        {
            new TMessage('error', $e->getMessage());    
        }
    }

    public function onSave($param = null) 
    {
        try
        {
            TTransaction::open(self::$database); // open a transaction

            $messageAction = null;

            $this->form->validate(); // validate form data

            $object = new Customers(); // create an empty object 

            $data = $this->form->getData(); // get form data as array
            $object->fromArray( (array) $data); // load the object with data

            $object->store(); // save the object 

            // get the generated {PRIMARY_KEY}
            $data->id = $object->id; 

            $this->form->setData($data); // fill form data
            TTransaction::close(); // close the transaction

            new TMessage('info', "Registro salvo", $messageAction); 

                        TScript::create("Template.closeRightPanel();"); 

        }
        catch (Exception $e) // in case of exception
        {

            new TMessage('error', $e->getMessage()); // shows the exception error message
            $this->form->setData( $this->form->getData() ); // keep form data
            TTransaction::rollback(); // undo all pending operations
        }
    }

    public function onEdit( $param )
    {
        try
        {
            if (isset($param['key']))
            {
                $key = $param['key'];  // get the parameter $key
                TTransaction::open(self::$database); // open a transaction

                $object = new Customers($key); // instantiates the Active Record 

                $this->form->setData($object); // fill the form 

                TTransaction::close(); // close the transaction 
            }
            else
            {
                $this->form->clear();
            }
        }
        catch (Exception $e) // in case of exception
        {
            new TMessage('error', $e->getMessage()); // shows the exception error message
            TTransaction::rollback(); // undo all pending operations
        }
    }

    /**
     * Clear form data
     * @param $param Request
     */
    public function onClear( $param )
    {
        $this->form->clear(true);

    }

    public function onShow($param = null)
    {

    } 

    public static function getFormName()
    {
        return self::$formName;
    }

}

