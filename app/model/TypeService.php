<?php

class TypeService extends TRecord
{
    const TABLENAME  = 'type_service';
    const PRIMARYKEY = 'id';
    const IDPOLICY   =  'serial'; // {max, serial}

    const CREATEDAT  = 'created_at';
    const UPDATEDAT  = 'updated_at';

    

    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('created_at');
        parent::addAttribute('updated_at');
        parent::addAttribute('name');
            
    }

    /**
     * Method getServices
     */
    public function getServices()
    {
        $criteria = new TCriteria;
        $criteria->add(new TFilter('type_id', '=', $this->id));
        return Service::getObjects( $criteria );
    }

    public function set_service_type_to_string($service_type_to_string)
    {
        if(is_array($service_type_to_string))
        {
            $values = TypeService::where('id', 'in', $service_type_to_string)->getIndexedArray('id', 'id');
            $this->service_type_to_string = implode(', ', $values);
        }
        else
        {
            $this->service_type_to_string = $service_type_to_string;
        }

        $this->vdata['service_type_to_string'] = $this->service_type_to_string;
    }

    public function get_service_type_to_string()
    {
        if(!empty($this->service_type_to_string))
        {
            return $this->service_type_to_string;
        }
    
        $values = Service::where('type_id', '=', $this->id)->getIndexedArray('type_id','{type->id}');
        return implode(', ', $values);
    }

    /**
     * Method onBeforeDelete
     */
    public function onBeforeDelete()
    {
            

        if(Service::where('type_id', '=', $this->id)->first())
        {
            throw new Exception("Não é possível deletar este registro pois ele está sendo utilizado em outra parte do sistema");
        }
    
    }

    
}

