package com.csscship.config;
import com.csscship.config.intercepors.LoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
 
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Autowired
    private LoginInterceptor loginInterceptor;
 
  // 这个方法用来配置静态资源
  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
  }
 
  // 这个方法用来注册拦截器
  @Override
  public void addInterceptors(InterceptorRegistry registry) {
      registry.addInterceptor(loginInterceptor).addPathPatterns("/**").excludePathPatterns("/csscShip/login","/csscShip", "/regist","/orderside/search","/csscShip/introduction",
             "/csscShip/service","/csscShip/guide","/csscShip/news","/login","/static/**");
  }
}



