package com.in28minutes.springboot.microservice.example.forex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ForexController {
  
  private Environment environment;
  
  private ExchangeValueRepository repository;
  
  @Autowired
  public ForexController(Environment environment,ExchangeValueRepository repository) {
	this.environment=environment;
	this.repository=repository;
  }
  
  
  @GetMapping("/currency-exchange/from/{from}/to/{to}")
  public ExchangeValue retrieveExchangeValue
    (@PathVariable String from, @PathVariable String to){
    
    ExchangeValue exchangeValue = 
        repository.findByFromAndTo(from, to);
    
    exchangeValue.setPort(
        Integer.parseInt(environment.getProperty("server.port")));
    
    return exchangeValue;
  }
}