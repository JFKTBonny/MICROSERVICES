package com.acme.ecom.product.controller;

import com.acme.ecom.product.model.Product;
import com.acme.ecom.product.model.ProductOR;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-09-06T15:34:16+0200",
    comments = "version: 1.5.5.Final, compiler: javac, environment: Java 21.0.8 (Ubuntu)"
)
@Component
public class ProductMapperImpl implements ProductMapper {

    @Override
    public Product entityToApi(ProductOR entity) {
        if ( entity == null ) {
            return null;
        }

        Product.ProductBuilder product = Product.builder();

        product.productId( entity.getProductId() );
        product.name( entity.getName() );
        product.code( entity.getCode() );
        product.title( entity.getTitle() );
        product.price( entity.getPrice() );
        product.category( entity.getCategory() );

        return product.build();
    }

    @Override
    public ProductOR apiToEntity(Product api) {
        if ( api == null ) {
            return null;
        }

        ProductOR productOR = new ProductOR();

        productOR.setProductId( api.getProductId() );
        productOR.setName( api.getName() );
        productOR.setCode( api.getCode() );
        productOR.setTitle( api.getTitle() );
        productOR.setPrice( api.getPrice() );
        productOR.setCategory( api.getCategory() );

        return productOR;
    }
}
