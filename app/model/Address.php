<?php

class Address extends TRecord
{
    const TABLENAME  = 'address';
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
        parent::addAttribute('cep');
        parent::addAttribute('rua');
        parent::addAttribute('created_at');
        parent::addAttribute('updated_at');
            
    }

    /**
     * Method getCustomerss
     */
    public function getCustomerss()
    {
        $criteria = new TCriteria;
        $criteria->add(new TFilter('address_id', '=', $this->id));
        return Customers::getObjects( $criteria );
    }

    public function set_customers_address_to_string($customers_address_to_string)
    {
        if(is_array($customers_address_to_string))
        {
            $values = Address::where('id', 'in', $customers_address_to_string)->getIndexedArray('id', 'id');
            $this->customers_address_to_string = implode(', ', $values);
        }
        else
        {
            $this->customers_address_to_string = $customers_address_to_string;
        }

        $this->vdata['customers_address_to_string'] = $this->customers_address_to_string;
    }

    public function get_customers_address_to_string()
    {
        if(!empty($this->customers_address_to_string))
        {
            return $this->customers_address_to_string;
        }
    
        $values = Customers::where('address_id', '=', $this->id)->getIndexedArray('address_id','{address->id}');
        return implode(', ', $values);
    }

    /**
     * Method onBeforeDelete
     */
    public function onBeforeDelete()
    {
            

        if(Customers::where('address_id', '=', $this->id)->first())
        {
            throw new Exception("Não é possível deletar este registro pois ele está sendo utilizado em outra parte do sistema");
        }
    
    }

    
}

