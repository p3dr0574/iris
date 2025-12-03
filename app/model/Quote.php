<?php

class Quote extends TRecord
{
    const TABLENAME  = 'quote';
    const PRIMARYKEY = 'id';
    const IDPOLICY   =  'serial'; // {max, serial}

    const CREATEDAT  = 'created_at';
    const UPDATEDAT  = 'updated_at';

    private Customers $customer;
    private StatusQuote $status;

    

    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('created_at');
        parent::addAttribute('updated_at');
        parent::addAttribute('customer_id');
        parent::addAttribute('status_id');
            
    }

    /**
     * Method set_customers
     * Sample of usage: $var->customers = $object;
     * @param $object Instance of Customers
     */
    public function set_customer(Customers $object)
    {
        $this->customer = $object;
        $this->customer_id = $object->id;
    }

    /**
     * Method get_customer
     * Sample of usage: $var->customer->attribute;
     * @returns Customers instance
     */
    public function get_customer()
    {
    
        // loads the associated object
        if (empty($this->customer))
            $this->customer = new Customers($this->customer_id);
    
        // returns the associated object
        return $this->customer;
    }
    /**
     * Method set_status_quote
     * Sample of usage: $var->status_quote = $object;
     * @param $object Instance of StatusQuote
     */
    public function set_status(StatusQuote $object)
    {
        $this->status = $object;
        $this->status_id = $object->id;
    }

    /**
     * Method get_status
     * Sample of usage: $var->status->attribute;
     * @returns StatusQuote instance
     */
    public function get_status()
    {
    
        // loads the associated object
        if (empty($this->status))
            $this->status = new StatusQuote($this->status_id);
    
        // returns the associated object
        return $this->status;
    }

    
}

