package com.store.controller;


import com.store.service.ProductService;
import com.store.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/Product")
public class ProductController {
    @Autowired
    ProductService productService;

    @Autowired
    StoreService storeService;


}
