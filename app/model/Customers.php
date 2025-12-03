<?php

class Customers extends TRecord
{
    const TABLENAME  = 'customers';
    const PRIMARYKEY = 'id';
    const IDPOLICY   =  'serial'; // {max, serial}

    const CREATEDAT  = 'created_at';
    const UPDATEDAT  = 'updated_at';

    private Address $address;

    

    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('name');
        parent::addAttribute('cnpj');
        parent::addAttribute('created_at');
        parent::addAttribute('updated_at');
        parent::addAttribute('cnae');
        parent::addAttribute('address_id');
        parent::addAttribute('website');
        parent::addAttribute('email');
            
    }

    /**
     * Method set_address
     * Sample of usage: $var->address = $object;
     * @param $object Instance of Address
     */
    public function set_address(Address $object)
    {
        $this->address = $object;
        $this->address_id = $object->id;
    }

    /**
     * Method get_address
     * Sample of usage: $var->address->attribute;
     * @returns Address instance
     */
    public function get_address()
    {
    
        // loads the associated object
        if (empty($this->address))
            $this->address = new Address($this->address_id);
    
        // returns the associated object
        return $this->address;
    }

    /**
     * Method getQuotes
     */
    public function getQuotes()
    {
        $criteria = new TCriteria;
        $criteria->add(new TFilter('customer_id', '=', $this->id));
        return Quote::getObjects( $criteria );
    }

    public function set_quote_customer_to_string($quote_customer_to_string)
    {
        if(is_array($quote_customer_to_string))
        {
            $values = Customers::where('id', 'in', $quote_customer_to_string)->getIndexedArray('id', 'id');
            $this->quote_customer_to_string = implode(', ', $values);
        }
        else
        {
            $this->quote_customer_to_string = $quote_customer_to_string;
        }

        $this->vdata['quote_customer_to_string'] = $this->quote_customer_to_string;
    }

    public function get_quote_customer_to_string()
    {
        if(!empty($this->quote_customer_to_string))
        {
            return $this->quote_customer_to_string;
        }
    
        $values = Quote::where('customer_id', '=', $this->id)->getIndexedArray('customer_id','{customer->id}');
        return implode(', ', $values);
    }

    public function set_quote_status_to_string($quote_status_to_string)
    {
        if(is_array($quote_status_to_string))
        {
            $values = StatusQuote::where('id', 'in', $quote_status_to_string)->getIndexedArray('id', 'id');
            $this->quote_status_to_string = implode(', ', $values);
        }
        else
        {
            $this->quote_status_to_string = $quote_status_to_string;
        }

        $this->vdata['quote_status_to_string'] = $this->quote_status_to_string;
    }

    public function get_quote_status_to_string()
    {
        if(!empty($this->quote_status_to_string))
        {
            return $this->quote_status_to_string;
        }
    
        $values = Quote::where('customer_id', '=', $this->id)->getIndexedArray('status_id','{status->id}');
        return implode(', ', $values);
    }

    /**
     * Method onBeforeDelete
     */
    public function onBeforeDelete()
    {
            

        if(Quote::where('customer_id', '=', $this->id)->first())
        {
            throw new Exception("Não é possível deletar este registro pois ele está sendo utilizado em outra parte do sistema");
        }
    
    }

    
}

