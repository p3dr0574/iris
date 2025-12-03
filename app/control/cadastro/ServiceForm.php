<?php

class ServiceForm extends TPage
{
    protected BootstrapFormBuilder $form;
    private $formFields = [];
    private static $database = 'gestao';
    private static $activeRecord = 'Service';
    private static $primaryKey = 'id';
    private static $formName = 'form_ServiceForm';

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
        $this->form->setFormTitle("ServiceForm");

        $criteria_type_id = new TCriteria();

        $name = new TEntry('name');
        $id = new THidden('id');
        $type_id = new TDBCombo('type_id', 'gestao', 'TypeService', 'id', '{name}','id asc' , $criteria_type_id );
        $button_cadastrar = new TButton('button_cadastrar');

        $type_id->addValidation("Type id", new TRequiredValidator()); 

        $name->setMaxLength(255);
        $type_id->enableSearch();
        $type_id->configureNoResultsCreateButton(new TAction(['TypeServiceForm', 'onShow']), "Cadastrar", " ", "btn-default");
        $button_cadastrar->setAction(new TAction([$this, 'onCadastrarTipo']), "Cadastrar");
        $button_cadastrar->addStyleClass('btn-default');
        $button_cadastrar->setImage('fas:plus #009688');
        $id->setSize(200);
        $name->setSize('100%');
        $type_id->setSize('81%');

        $row1 = $this->form->addFields([new TLabel("Nome:", null, '14px', null, '100%'),$name,$id],[new TLabel("Tipo:", '#ff0000', '14px', null, '100%'),$type_id,$button_cadastrar]);
        $row1->layout = ['col-sm-6','col-sm-6'];

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

        $style = new TStyle('right-panel > .container-part[page-name=ServiceForm]');
        $style->width = '70% !important';   
        $style->show(true);

    }

    public  function onCadastrarTipo($param = null) 
    {
        try 
        {
            AdiantiCoreApplication::loadPage('TypeServiceForm', 'onShow', []);

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

            $object = new Service(); // create an empty object 

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

                $object = new Service($key); // instantiates the Active Record 

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

