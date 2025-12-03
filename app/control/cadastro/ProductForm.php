<?php

class ProductForm extends TPage
{
    protected BootstrapFormBuilder $form;
    private $formFields = [];
    private static $database = 'gestao';
    private static $activeRecord = 'Product';
    private static $primaryKey = 'id';
    private static $formName = 'form_ProductForm';

    use BuilderMasterDetailFieldListTrait;

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
        $this->form->setFormTitle("Produto");

        $criteria_type_id = new TCriteria();
        $criteria_service_requirement_product_service_id = new TCriteria();

        $name = new TEntry('name');
        $id = new THidden('id');
        $type_id = new TDBCombo('type_id', 'gestao', 'TypeProduct', 'id', '{name}','id asc' , $criteria_type_id );
        $button_cadastrar = new TButton('button_cadastrar');
        $service_requirement_product_id = new THidden('service_requirement_product_id[]');
        $service_requirement_product___row__id = new THidden('service_requirement_product___row__id[]');
        $service_requirement_product___row__data = new THidden('service_requirement_product___row__data[]');
        $service_requirement_product_service_id = new TDBCombo('service_requirement_product_service_id[]', 'gestao', 'Service', 'id', '{name}','id asc' , $criteria_service_requirement_product_service_id );
        $service_requirement_product_is_required = new TCombo('service_requirement_product_is_required[]');
        $this->fieldList_692c77e35569a = new TFieldList();

        $this->fieldList_692c77e35569a->addField(null, $service_requirement_product_id, []);
        $this->fieldList_692c77e35569a->addField(null, $service_requirement_product___row__id, ['uniqid' => true]);
        $this->fieldList_692c77e35569a->addField(null, $service_requirement_product___row__data, []);
        $this->fieldList_692c77e35569a->addField(new TLabel("Serviço:", null, '14px', null), $service_requirement_product_service_id, ['width' => '50%']);
        $this->fieldList_692c77e35569a->addField(new TLabel("Requerido:", null, '14px', null), $service_requirement_product_is_required, ['width' => '50%']);

        $this->fieldList_692c77e35569a->width = '100%';
        $this->fieldList_692c77e35569a->setFieldPrefix('service_requirement_product');
        $this->fieldList_692c77e35569a->name = 'fieldList_692c77e35569a';

        $this->criteria_fieldList_692c77e35569a = new TCriteria();
        $this->default_item_fieldList_692c77e35569a = new stdClass();

        $this->form->addField($service_requirement_product_id);
        $this->form->addField($service_requirement_product___row__id);
        $this->form->addField($service_requirement_product___row__data);
        $this->form->addField($service_requirement_product_service_id);
        $this->form->addField($service_requirement_product_is_required);

        $this->fieldList_692c77e35569a->setRemoveAction(null, 'fas:times #dd5a43', "Excluír");

        $name->addValidation("Name", new TRequiredValidator()); 
        $type_id->addValidation("Type id", new TRequiredValidator()); 
        $service_requirement_product_service_id->addValidation("Service id", new TRequiredListValidator()); 

        $name->setMaxLength(255);
        $type_id->configureNoResultsCreateButton(new TAction(['TypeProductForm', 'onShow']), "Cadastrar", " ", "btn-default");
        $button_cadastrar->setAction(new TAction([$this, 'onCadastrarTipo']), "Cadastrar");
        $button_cadastrar->addStyleClass('btn-default');
        $button_cadastrar->setImage('fas:plus #009688');
        $service_requirement_product_is_required->addItems(["T"=>"Sim","F"=>"Não"]);
        $service_requirement_product_is_required->setDefaultOption(false);
        $service_requirement_product_is_required->setValue('T');
        $type_id->enableSearch();
        $service_requirement_product_service_id->enableSearch();
        $service_requirement_product_is_required->enableSearch();

        $id->setSize(200);
        $name->setSize('100%');
        $type_id->setSize('82%');
        $service_requirement_product_service_id->setSize('100%');
        $service_requirement_product_is_required->setSize('100%');

        $row1 = $this->form->addFields([new TLabel("Nome:", '#ff0000', '14px', null, '100%'),$name,$id],[new TLabel("Tipo:", '#ff0000', '14px', null, '100%'),$type_id,$button_cadastrar]);
        $row1->layout = ['col-sm-6','col-sm-6'];

        $row2 = $this->form->addFields([$this->fieldList_692c77e35569a]);
        $row2->layout = [' col-sm-12'];

        // create the form actions
        $btn_onsave = $this->form->addAction("Salvar", new TAction([$this, 'onSave'],['static' => 1]), 'fas:save #ffffff');
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

        $style = new TStyle('right-panel > .container-part[page-name=ProductForm]');
        $style->width = '70% !important';   
        $style->show(true);

    }

    public static function onCadastrarTipo($param = null) 
    {
        try 
        {
            AdiantiCoreApplication::loadPage('TypeProductForm', 'onShow', []);

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

            $object = new Product(); // create an empty object 

            $data = $this->form->getData(); // get form data as array
            $object->fromArray( (array) $data); // load the object with data

            $object->store(); // save the object 

            $service_requirement_product_items = $this->storeItems('ServiceRequirement', 'product_id', $object, $this->fieldList_692c77e35569a, function($masterObject, $detailObject){ 

                //code here

            }, $this->criteria_fieldList_692c77e35569a); 

            // get the generated {PRIMARY_KEY}
            $data->id = $object->id; 

            $this->form->setData($data); // fill form data
            TTransaction::close(); // close the transaction

            new TMessage('info', "Registro salvo", $messageAction); 

                        TScript::create("Template.closeRightPanel();");
            TForm::sendData(self::$formName, (object)['id' => $object->id]);

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

                $object = new Product($key); // instantiates the Active Record 

                $this->fieldList_692c77e35569a_items = $this->loadItems('ServiceRequirement', 'product_id', $object, $this->fieldList_692c77e35569a, function($masterObject, $detailObject, $objectItems){ 

                    //code here

                }, $this->criteria_fieldList_692c77e35569a); 

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

        $this->fieldList_692c77e35569a->addHeader();
        $this->fieldList_692c77e35569a->addDetail($this->default_item_fieldList_692c77e35569a);

        $this->fieldList_692c77e35569a->addCloneAction(null, 'fas:plus #69aa46', "Clonar");

    }

    public function onShow($param = null)
    {
        $this->fieldList_692c77e35569a->addHeader();
        $this->fieldList_692c77e35569a->addDetail($this->default_item_fieldList_692c77e35569a);

        $this->fieldList_692c77e35569a->addCloneAction(null, 'fas:plus #69aa46', "Clonar");

    } 

    public static function getFormName()
    {
        return self::$formName;
    }

}

