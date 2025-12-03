<?php

class StatusQuote extends TRecord
{
    const TABLENAME  = 'status_quote';
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
        parent::addAttribute('name');
        parent::addAttribute('notes');
        parent::addAttribute('created_at');
        parent::addAttribute('updated_at');
            
    }

    /**
     * Method getQuotes
     */
    public function getQuotes()
    {
        $criteria = new TCriteria;
        $criteria->add(new TFilter('status_id', '=', $this->id));
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
    
        $values = Quote::where('status_id', '=', $this->id)->getIndexedArray('customer_id','{customer->id}');
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
    
        $values = Quote::where('status_id', '=', $this->id)->getIndexedArray('status_id','{status->id}');
        return implode(', ', $values);
    }

    /**
     * Method onBeforeDelete
     */
    public function onBeforeDelete()
    {
            

        if(Quote::where('status_id', '=', $this->id)->first())
        {
            throw new Exception("Não é possível deletar este registro pois ele está sendo utilizado em outra parte do sistema");
        }
    
    }

    
}

