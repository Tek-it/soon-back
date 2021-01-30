package soon.io.soon.Controllers.order;

import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import soon.io.soon.DTO.order.OrderDTO;
import soon.io.soon.Services.order.OrderService;


import java.util.List;

@RestController
@RequestMapping("/api/order")
@AllArgsConstructor
public class OrderController {

    private final OrderService orderService;

    @PostMapping
    public ResponseEntity<OrderDTO> placeOrder(@RequestBody OrderDTO orderDTO) {
        OrderDTO result = orderService.createOrder(orderDTO);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @GetMapping("/current-restaurant")
    public ResponseEntity<List<OrderDTO>> getCurrentRestaurantOrders() {
        List<OrderDTO> result = orderService.getOrdersByRestaurantId();
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @GetMapping("/current-restaurant/{id}")
    public ResponseEntity<OrderDTO> getCurrentRestaurantOrderById(@PathVariable("id") long id) {
        OrderDTO result = orderService.getOrderById(id);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @PutMapping("/current-restaurant/{id}/accept")
    public ResponseEntity<OrderDTO> acceptOrderByRestaurant(@PathVariable("id") Long id) {
        OrderDTO result = orderService.acceptOrderByRestaurant(id);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @PutMapping("/{id}/delivered")
    public ResponseEntity<OrderDTO> orderDelivered(@PathVariable("id") Long id) {
        OrderDTO result = orderService.onDeliveredByDriver(id);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }
}
