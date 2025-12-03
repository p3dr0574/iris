<?php

class Product extends TRecord
{
    const TABLENAME  = 'product';
    const PRIMARYKEY = 'id';
    const IDPOLICY   =  'serial'; // {max, serial}

    const CREATEDAT  = 'created_at';
    const UPDATEDAT  = 'updated_at';

    private TypeProduct $type;

    

    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('name');
        parent::addAttribute('created_at');
        parent::addAttribute('updated_at');
        parent::addAttribute('type_id');
            
    }

    /**
     * Method set_type_product
     * Sample of usage: $var->type_product = $object;
     * @param $object Instance of TypeProduct
     */
    public function set_type(TypeProduct $object)
    {
        $this->type = $object;
        $this->type_id = $object->id;
    }

    /**
     * Method get_type
     * Sample of usage: $var->type->attribute;
     * @returns TypeProduct instance
     */
    public function get_type()
    {
    
        // loads the associated object
        if (empty($this->type))
            $this->type = new TypeProduct($this->type_id);
    
        // returns the associated object
        return $this->type;
    }

    /**
     * Method getServiceRequirements
     */
    public function getServiceRequirements()
    {
        $criteria = new TCriteria;
        $criteria->add(new TFilter('product_id', '=', $this->id));
        return ServiceRequirement::getObjects( $criteria );
    }

    public function set_service_requirement_product_to_string($service_requirement_product_to_string)
    {
        if(is_array($service_requirement_product_to_string))
        {
            $values = Product::where('id', 'in', $service_requirement_product_to_string)->getIndexedArray('id', 'id');
            $this->service_requirement_product_to_string = implode(', ', $values);
        }
        else
        {
            $this->service_requirement_product_to_string = $service_requirement_product_to_string;
        }

        $this->vdata['service_requirement_product_to_string'] = $this->service_requirement_product_to_string;
    }

    public function get_service_requirement_product_to_string()
    {
        if(!empty($this->service_requirement_product_to_string))
        {
            return $this->service_requirement_product_to_string;
        }
    
        $values = ServiceRequirement::where('product_id', '=', $this->id)->getIndexedArray('product_id','{product->id}');
        return implode(', ', $values);
    }

    public function set_service_requirement_service_to_string($service_requirement_service_to_string)
    {
        if(is_array($service_requirement_service_to_string))
        {
            $values = Service::where('id', 'in', $service_requirement_service_to_string)->getIndexedArray('id', 'id');
            $this->service_requirement_service_to_string = implode(', ', $values);
        }
        else
        {
            $this->service_requirement_service_to_string = $service_requirement_service_to_string;
        }

        $this->vdata['service_requirement_service_to_string'] = $this->service_requirement_service_to_string;
    }

    public function get_service_requirement_service_to_string()
    {
        if(!empty($this->service_requirement_service_to_string))
        {
            return $this->service_requirement_service_to_string;
        }
    
        $values = ServiceRequirement::where('product_id', '=', $this->id)->getIndexedArray('service_id','{service->id}');
        return implode(', ', $values);
    }

    /**
     * Method onBeforeDelete
     */
    public function onBeforeDelete()
    {
            

        if(ServiceRequirement::where('product_id', '=', $this->id)->first())
        {
            throw new Exception("Não é possível deletar este registro pois ele está sendo utilizado em outra parte do sistema");
        }
    
    }

    
}

