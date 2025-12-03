<?php

class TypeProduct extends TRecord
{
    const TABLENAME  = 'type_product';
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
        parent::addAttribute('created_at');
        parent::addAttribute('updated_at');
        parent::addAttribute('hazardous');
            
    }

    /**
     * Method getProducts
     */
    public function getProducts()
    {
        $criteria = new TCriteria;
        $criteria->add(new TFilter('type_id', '=', $this->id));
        return Product::getObjects( $criteria );
    }

    public function set_product_type_to_string($product_type_to_string)
    {
        if(is_array($product_type_to_string))
        {
            $values = TypeProduct::where('id', 'in', $product_type_to_string)->getIndexedArray('id', 'id');
            $this->product_type_to_string = implode(', ', $values);
        }
        else
        {
            $this->product_type_to_string = $product_type_to_string;
        }

        $this->vdata['product_type_to_string'] = $this->product_type_to_string;
    }

    public function get_product_type_to_string()
    {
        if(!empty($this->product_type_to_string))
        {
            return $this->product_type_to_string;
        }
    
        $values = Product::where('type_id', '=', $this->id)->getIndexedArray('type_id','{type->id}');
        return implode(', ', $values);
    }

    /**
     * Method onBeforeDelete
     */
    public function onBeforeDelete()
    {
            

        if(Product::where('type_id', '=', $this->id)->first())
        {
            throw new Exception("Não é possível deletar este registro pois ele está sendo utilizado em outra parte do sistema");
        }
    
    }

    
}

