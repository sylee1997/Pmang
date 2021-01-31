package spring.conf;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

@Configuration
public class SpringConfiguration {
	
	@Autowired
	private ApplicationContext applicationContext;
	
	@Bean
	public BasicDataSource dataSource(){
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		basicDataSource.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		basicDataSource.setUsername("c##java");
		basicDataSource.setPassword("bit");
		basicDataSource.setMaxTotal(20);
		basicDataSource.setMaxIdle(3);
		
		return basicDataSource;
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("spring/mybatis-config.xml"));
		sqlSessionFactoryBean.setDataSource(dataSource());
		//mapper 파일이 두개 이므로 *를 사용해서 모든 mapper 파일을 읽도록 해야 한다.
		//하지만 ClassPathResource를 사용하면 * 가 먹지 않기 때문에 아래와 같이 getResources를 사용해준다.
		//sqlSessionFactoryBean.setMapperLocations(new ClassPathResource("member/dao/memberMapper.xml"));
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:*/dao/*Mapper.xml"));
		return sqlSessionFactoryBean.getObject();
	}

	@Bean
	public SqlSessionTemplate sqlSession() throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory());
	}

	@Bean
	public DataSourceTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}
}