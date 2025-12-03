<?php

class ServiceRequirement extends TRecord
{
    const TABLENAME  = 'service_requirement';
    const PRIMARYKEY = 'id';
    const IDPOLICY   =  'serial'; // {max, serial}

    const CREATEDAT  = 'created_at';
    const UPDATEDAT  = 'updated_at';

    private Product $product;
    private Service $service;

    

    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('created_at');
        parent::addAttribute('updated_at');
        parent::addAttribute('product_id');
        parent::addAttribute('service_id');
        parent::addAttribute('is_required');
        parent::addAttribute('notes');
            
    }

    /**
     * Method set_product
     * Sample of usage: $var->product = $object;
     * @param $object Instance of Product
     */
    public function set_product(Product $object)
    {
        $this->product = $object;
        $this->product_id = $object->id;
    }

    /**
     * Method get_product
     * Sample of usage: $var->product->attribute;
     * @returns Product instance
     */
    public function get_product()
    {
    
        // loads the associated object
        if (empty($this->product))
            $this->product = new Product($this->product_id);
    
        // returns the associated object
        return $this->product;
    }
    /**
     * Method set_service
     * Sample of usage: $var->service = $object;
     * @param $object Instance of Service
     */
    public function set_service(Service $object)
    {
        $this->service = $object;
        $this->service_id = $object->id;
    }

    /**
     * Method get_service
     * Sample of usage: $var->service->attribute;
     * @returns Service instance
     */
    public function get_service()
    {
    
        // loads the associated object
        if (empty($this->service))
            $this->service = new Service($this->service_id);
    
        // returns the associated object
        return $this->service;
    }

    
}

