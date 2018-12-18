package com.store.entity;

public class Product extends ProductKey {
    private String name;

    private Float originalprice;

    private Float promoteprice;

    private Integer stock;

    private String description;

    private String createdate;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Float getOriginalprice() {
        return originalprice;
    }

    public void setOriginalprice(Float originalprice) {
        this.originalprice = originalprice;
    }

    public Float getPromoteprice() {
        return promoteprice;
    }

    public void setPromoteprice(Float promoteprice) {
        this.promoteprice = promoteprice;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate == null ? null : createdate.trim();
    }
}