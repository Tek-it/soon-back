package soon.io.soon.models.item;

import lombok.*;
import soon.io.soon.models.dish.Dish;

import javax.persistence.*;


public class Item {

    private int id;

    private Dish dish;
    private int quantity;
}
