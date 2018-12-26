package com.store.service;

import com.store.entity.Propertyvalue;

import java.util.List;

public interface PropertyvalueService {

    List<Propertyvalue> getValueByProductId(int productId);

}

