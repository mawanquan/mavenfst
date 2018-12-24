package com.test;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.MessageProducer;
import javax.jms.Queue;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;

import com.bean.EmailMessage;
import com.untils.Email;

public class TextSends {
	public static void main(String[] args) throws JMSException {

		EmailMessage em = new EmailMessage();
		em.setSubject("hello11");
		em.setText("第456个邮件");
		em.setTouser("3216563375@qq.com");
		//Email email=new Email();
		//email.myEmail(em);
		sendTo(em);
	}

	public static void sendTo(EmailMessage emailmessage) throws JMSException {
		ConnectionFactory connectionFactory = new ActiveMQConnectionFactory(
				"tcp://192.168.43.155:61616");
		// 2.获取连接
		Connection connection = connectionFactory.createConnection();
		// 3.启动连接
		connection.start();
		/*
		 * 4.获取session (参数1：是否启动事务, 参数2：消息确认模式[ AUTO_ACKNOWLEDGE = 1 自动确认
		 * CLIENT_ACKNOWLEDGE = 2 客户端手动确认 DUPS_OK_ACKNOWLEDGE = 3 自动批量确认
		 * SESSION_TRANSACTED = 0 事务提交并确认 ])
		 */
		Session session = connection.createSession(false,
				Session.AUTO_ACKNOWLEDGE);
		// 5.创建队列对象
		Queue queue = session.createQueue("test-queue");
		// 6.创建消息生产者
		MessageProducer producer = session.createProducer(queue);
		// 7.创建消息

		MapMessage mapMessage = session.createMapMessage();
		mapMessage.setString("subject2", emailmessage.getSubject());
		mapMessage.setString("text2", emailmessage.getText());
		mapMessage.setString("touser2", emailmessage.getTouser());
		// 8.发送消息
		producer.send(mapMessage);
		// 9.关闭资源
		producer.close();
		session.close();
		connection.close();

	}
}
