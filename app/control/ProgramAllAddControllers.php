<?php

class ProgramAllAddControllers extends TPage
{
    protected $form;
    private $formFields = [];
    private static $database = '';
    private static $activeRecord = '';
    private static $primaryKey = '';
    private static $formName = 'form_ProgramAllAddControllers';

    /**
     * Form constructor
     * @param $param Request
     */
    public function __construct( $param = null)
    {
        parent::__construct();

        if(!empty($param['target_container']))
        {
            $this->adianti_target_container = $param['target_container'];
        }

        // creates the form
        $this->form = new BootstrapFormBuilder(self::$formName);
        // define the form title
        $this->form->setFormTitle("Adicionar todos programas");


        $programs = new TCheckGroup('programs');


        $programs->setSize(150);
        $programs->setLayout('horizontal');
        $programs->setBreakItems(2);

        // gerar items para o array;
        $programs->checkAll(true);

        $items = self::getPrograms(true);
        $programs->addItems($items);
        $row1 = $this->form->addFields([$programs]);
        $row1->layout = [' col-sm-12'];

        // create the form actions
        $btn_onaction = $this->form->addAction("Salvar programas", new TAction([$this, 'onAction']), 'fas:ad #ffffff');
        $this->btn_onaction = $btn_onaction;
        $btn_onaction->addStyleClass('btn-success'); 

        // vertical box container
        $container = new TVBox;
        $container->style = 'width: 100%';
        $container->class = 'form-container';
        if(empty($param['target_container']))
        {
            // $container->add(TBreadCrumb::create(["Gerencial","Adicionar Programas"]));
        }
        $container->add($this->form);

        parent::add($container);

    }

    public function onAction($param = null) 
    {
       try
        {

            $data = $this->form->getData();
            // var_dump($param);
            // echo '<pre>';
            // var_dump($data);

            if ($data->programs) 
            {
                foreach ($data->programs as $program)
                {
                    TTransaction::open('gestao');
                    $object = new SystemProgram;
                    $object->name = preg_replace('/([a-z])([A-Z])/', '$1 $2', $program); 
                    $object->controller = $program;
                    $object->store();
                    $object->clearParts();

                    if( !empty($data->groups) )
                    {
                        foreach( $data->groups as $group_id )
                        {
                            $object->addSystemGroup( new SystemGroup($group_id) );
                        }
                    }

                    TTransaction::close();
                }
            }

            new TMessage('info', AdiantiCoreTranslator::translate('Record saved'));

            return $object;
        }
        catch (Exception $e) // in case of exception
        {
            // get the form data
            new TMessage('error', $e->getMessage());
            TTransaction::rollback();
        }
    }

    public function onShow($param = null)
    {               

    } 

public function getPrograms( $just_new_programs = false )
    {
        try
        {
            TTransaction::open('permission');
            $registered_programs = SystemProgram::getIndexedArray('id', 'controller');
            TTransaction::close();

            $entries = array();
            $iterator = new AppendIterator();
            $iterator->append(new RecursiveIteratorIterator(new RecursiveDirectoryIterator('app/control'), RecursiveIteratorIterator::CHILD_FIRST));
            $iterator->append(new RecursiveIteratorIterator(new RecursiveDirectoryIterator('app/view'),    RecursiveIteratorIterator::CHILD_FIRST));

            foreach ($iterator as $arquivo)
            {
                if (substr($arquivo, -4) == '.php')
                {
                    $name = $arquivo->getFileName();
                    $pieces = explode('.', $name);
                    $class = (string) $pieces[0];

                    if ($just_new_programs)
                    {
                        if (!in_array($class, $registered_programs) AND !in_array($class, array_keys(TApplication::getDefaultPermissions())) AND substr($class,0,6) !== 'System')
                        {
                            $entries[$class] = $class;
                        } 
                    }
                    else
                    {
                        $entries[$class] = $class;
                    }
                }
            }

            ksort($entries);
            return $entries;
        }
        catch (Exception $e)
        {
            new TMessage('error', $e->getMessage());
        }
    }

}

