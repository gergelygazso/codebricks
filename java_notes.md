<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>

<p align="center">
  <img src="images/codebricks-logo-2in1.jpeg" width="50%" height="auto"/>
</p>

<br>

<p align="center">
  <img src="images/icons8-java-48.png" width="48" height="48"/>
  <img src="images/icons8-spring-boot-48.png" width="48" height="48"/>
</p>

<br>

```java
String hql = "FROM Employee E WHERE E.id > 10 ORDER BY E.salary DESC";
```

# Spring
## Relationship between JPA, Hibernate and Spring Data JPA
### JPA
<p>
  JPA stands for Java Persistence API. It's a specification to persist Java objects in relational Database. It cannot be used without an ORM implementation like Hibernate or EclipseLink. Hibernate is the de facto JPA     implementation standard.
</p>

<p>
  java. persistence package includes the JPA classes and interfaces. It provides:
  <ul>
    <li>
      JPA provides JPQL (Java Persistence Query Language). Hibernate's HQL is an extended version or a superset of JPQL. HQL is a query language that will be translated to plain SQL queries. It's syntax operates with objects and properties, instead of tables and columns. An example of HQL syntax: String hql = "FROM Employee E WHERE E.id > 10 ORDER BY E.salary DESC"
    </li>
    <li>For persisting mapped entities, JPA provides EntityManagerFactory interface, whereas Hibernate uses the SessionFactory. Note that JPA's EntityManager is only an interface, it's implemented by Hibernate.</li>
  </ul>
</p>

<p>So JPA provides some in-built stuff that is used by every kind of JPA implementations, hence if you change your ORM framework (let's say from Hibernate to EclipseLink) your code will not break. Hibernate specific functionality can be used only, if you are sure you don't want to replace it in the future.</p>

### Hibernate
<p>
  <img src="images/hibernate_architecture.jpg" width="50%" height="auto"/>
</p>
<p>Hibernate is an ORM framework, a JPA implementation. Spring Boot uses Hibernate as the default JPA implementation. It uses JDBC to communicate with the Database. Before Hibernate, developers used JDBC directly to persist data, and mapped manually to the DTO objects. Using Hibernate, you can minimize the JDBC code you have to write. Hibernate maps the relational database table to a Java object. It provides HQL for writing queries using objects and properties instead of tables and columns.</p>

<p>
  Hibernate supports writing native queries as well, but it's not recommended, because if you change the database behind your app, your query can break. But if you uses HQL instead, Hibernate will translate it to new Database syntax, after you configurated the new database dialect.
</p>

<p>https://medium.com/javarevisited/hibernate-vs-jpa-vs-spring-data-jpa-ff4485aaa780 --> Ez alapján folytatni!</p>



