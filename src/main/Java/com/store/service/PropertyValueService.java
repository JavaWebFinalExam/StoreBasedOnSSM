package com.store.service;

import com.store.entity.Propertyvalue;

import java.util.List;

public interface PropertyValueService {
    int insertPropertyValue(Propertyvalue propertyvalue);

    public List<Propertyvalue> getValueByProductId(int productId);

}
