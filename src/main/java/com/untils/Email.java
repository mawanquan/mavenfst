package com.untils;

import javax.annotation.Resource;








import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.EmailMessage;
@Component("email")
public class Email {
	@Resource(name="mailSender")
	JavaMailSender sender;
	@Resource(name="mailMessage")
	SimpleMailMessage mailMessage;
	public Boolean myEmail(EmailMessage em) {
		//EmailMessage em
		/*EmailMessage em = new EmailMessage();
		em.setSubject("hello");
		em.setText("第一个邮件");
		em.setTouser("1044958122@qq.com");*/
		System.out.println("准备发动邮件");
		System.out.println(em.getSubject());
		mailMessage.setSubject(em.getSubject());
		mailMessage.setText(em.getText());
		mailMessage.setTo(em.getTouser());
		sender.send(mailMessage);
		System.out.println("okle");
		return true;

	}
}
