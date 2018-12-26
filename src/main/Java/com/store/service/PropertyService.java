package com.store.service;

import com.store.entity.Property;
import com.store.entity.Propertyvalue;

public interface PropertyService {

    Property getByProductId(int productId);

}
