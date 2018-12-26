package com.store.service;

import com.store.entity.Property;

import java.util.List;

public interface PropertyService {

    List<Property> selectByCategoryId(int categoryId);
}
