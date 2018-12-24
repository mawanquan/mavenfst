package com.untils;

import javax.annotation.Resource;
import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.Queue;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.springframework.stereotype.Component;

import com.bean.EmailMessage;

@Component("read")
public class Read {

	@Resource(name = "email")
	Email en;

	public void read() {
		System.out.println(123);
		// 1.创建连接工厂
		ConnectionFactory connectionFactory = new ActiveMQConnectionFactory(
				"tcp://192.168.43.155:61616");
		// 2.获取连接
		Connection connection = null;
		Queue queue = null;
		MessageConsumer consumer = null;
		Session session = null;
		try {
			connection = connectionFactory.createConnection();
			connection.start();
			// 4.获取session (参数1：是否启动事务,参数2：消息确认模式)
			session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
			// 5.创建队列对象
			queue = session.createQueue("test-queue");
			// 6.创建消息消费者
			consumer = session.createConsumer(queue);
			System.out.println(1);
			// Email email;

			while (true) {
				MapMessage mapMessage = (MapMessage) consumer.receive();
				// System.out.println(mapMessage+"=="+mapMessage.getString("subject2"));
				EmailMessage em = new EmailMessage();
				em.setSubject(mapMessage.getString("subject2"));
				em.setText(mapMessage.getString("text2"));
				em.setTouser(mapMessage.getString("touser2"));
				// Email en = new Email();
				en.myEmail(em);

				System.out.println(3);
			}
		} catch (JMSException e) {

			e.printStackTrace();
		} finally {
			// 8.关闭资源
			try {
				consumer.close();
				session.close();
				connection.close();
			} catch (JMSException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				// read();
			}

		}

		// 3.启动连接

	}
}
