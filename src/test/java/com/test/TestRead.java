package com.test;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.Queue;
import javax.jms.Session;
 
import org.apache.activemq.ActiveMQConnectionFactory;

import com.bean.EmailMessage;
import com.untils.Email; 

public class TestRead {
	
	public static void main(String[] args) throws JMSException {
		// 1.创建连接工厂 
		ConnectionFactory connectionFactory = new ActiveMQConnectionFactory(
				"tcp://192.168.43.181:61616");
		// 2.获取连接
		Connection connection = connectionFactory.createConnection();
		// 3.启动连接
		connection.start();
		// 4.获取session (参数1：是否启动事务,参数2：消息确认模式)
		Session session = connection.createSession(false,
				Session.AUTO_ACKNOWLEDGE);
		// 5.创建队列对象
		Queue queue = session.createQueue("test-queue");
		// 6.创建消息消费者
		MessageConsumer consumer = session.createConsumer(queue);
		System.out.println(1);
		try {
			while (true) {
				MapMessage mapMessage = (MapMessage) consumer.receive();
//				System.out.println(mapMessage+"=="+mapMessage.getString("subject2"));
				String a=mapMessage.getString("subject2");
				EmailMessage em = new EmailMessage();
				em.setSubject(a);
				em.setText(mapMessage.getString("text2"));
				em.setTouser(mapMessage.getString("touser2"));
				Email en = new Email();
				//en.myEmail(em);

				System.out.println(3);
			}
		} catch (JMSException e) {

			e.printStackTrace();
		} finally {
			// 8.关闭资源
			consumer.close();
			session.close();
			connection.close();
		}

		// Email email;
		// 7.监听消息
		// consumer.setMessageListener(new MessageListener() {
		// @Override
		// public void onMessage(Message message) {
		// System.out.println(2);
		// MapMessage mapMessage = (MapMessage) message;
		// System.out.println(mapMessage);
		// try {
		// EmailMessage em = new EmailMessage();
		// em.setSubject(mapMessage.getString("subject"));
		// em.setText(mapMessage.getString("text"));
		// em.setTouser(mapMessage.getString("touser"));
		// Email en = new Email();
		// en.myEmail(em);
		// // Read.this.email.myEmail(em);
		// } catch (JMSException e) {
		// e.printStackTrace();
		// }
		// }
		// });

	}
}
