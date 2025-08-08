package com.example.springbootmvcjdbc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@Configuration
@EnableTransactionManagement
public class DatabaseConfig {

    // Configure your database path here
    private static final String DB_PATH = "/Users/ritet/OneDrive/Documents/Coding/Caltech/FSD bootcamp/course 3/spring-boot-mvc-jdbc/src/main/resources/db/students_db.db";

    @Bean
    public DataSource dataSource() {
        org.sqlite.SQLiteDataSource dataSource = new org.sqlite.SQLiteDataSource();
        dataSource.setUrl("jdbc:sqlite:" + DB_PATH);

        System.out.println("Using SQLite database at: " + DB_PATH);

        return dataSource;
    }

    @Bean
    public JdbcTemplate jdbcTemplate(DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }

    @Bean
    public PlatformTransactionManager transactionManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }
}