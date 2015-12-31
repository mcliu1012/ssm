package com.mcliu.ssm.util;

import java.io.IOException;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.httpclient.protocol.Protocol;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



public class HttpClientUtil {
	
	private static final Logger LOG = LoggerFactory.getLogger(HttpClientUtil.class);

	private static final String APPLICATION_JSON = "application/json";

	@SuppressWarnings("unused")
	private static final String CONTENT_TYPE_TEXT_JSON = "text/json";

	private static final String UTF_8 = "UTF-8";

	/**
	 * 往指定的URL发送数据。（JSON）
	 * 
	 * @param data
	 * @param url
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public final static String sendData(String data, String url) {
		HttpClient httpClient = new HttpClient();

		PostMethod httpPost = new PostMethod(url);
		httpPost.setRequestHeader("content-type", APPLICATION_JSON);
		RequestEntity se = new StringRequestEntity(data);
		httpPost.setRequestEntity(se);
		try {

			int responseCode = httpClient.executeMethod(httpPost);
			if (responseCode == 200) {
				byte[] resBody = httpPost.getResponseBody();

				String responseString = "";
				if (null == resBody || 0 == resBody.length) {
					responseString = httpPost.getResponseBodyAsString();
				} else {
					responseString = new String(resBody, UTF_8);
				}
				return responseString;
			}

		} catch (Exception e) {
			e.printStackTrace();
			// Assert.fail(e.getLocalizedMessage());

		}
		return "";
	}

	/**
	 * 往指定的URL发送数据。（JSON+HTTPS）
	 * 
	 * @param data
	 * @param url
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public final static String sendDataHttps(String data, String url) {
		//HttpClient httpClient = new HttpClient();

		try {
			Protocol myhttps = new Protocol("https",
					new MySSLProtocolSocketFactory(), 443);

			Protocol.registerProtocol("https", myhttps);

			PostMethod httpPost = new PostMethod(url);
			// GetMethod httpGet = new GetMethod(url);
			httpPost.setRequestHeader("content-type", "application/json");
			RequestEntity se = new StringRequestEntity(data);
			httpPost.setRequestEntity(se);

			// httpPost.setRequestHeader("content-type", APPLICATION_JSON);
			// RequestEntity se = new StringRequestEntity(data);
			// httpPost.setRequestEntity(se);

			//int responseCode = httpClient.executeMethod(httpPost);
			byte[] resBody = httpPost.getResponseBody();

			String responseString = "";
			if (null == resBody || 0 == resBody.length) {
				responseString = httpPost.getResponseBodyAsString();
			} else {
				responseString = new String(resBody, UTF_8);
			}
			return responseString;

		} catch (Exception e) {
			e.printStackTrace();
			// Assert.fail(e.getLocalizedMessage());

		}
		return "";
	}
	public static String postByText(String url, Map<String, String> params) throws HttpException, IOException {
		return post(url,params,"text/html;charset=utf-8");
	}
	public static String postByXml(String url, Map<String, String> params) throws HttpException, IOException {
		return post(url,params,"text/xml;charset=utf-8");
	}
	public static String post(String url, Map<String, String> params,String contentType) throws HttpException, IOException {
		PostMethod post = new PostMethod(url);  
        post.setRequestHeader("Content-Type",contentType);    
        for (String key : params.keySet()){
        	post.setParameter(key, params.get(key));
        }
        HttpClient httpClient = new HttpClient();
        httpClient.executeMethod(post);
        String response = post.getResponseBodyAsString();
		return response;
	}
	public static String postByBody(String url, String body,String contentType) throws HttpException, IOException {
		PostMethod post = new PostMethod(url);  
        post.setRequestHeader("Content-Type",contentType); 
        post.setRequestBody(body);
        HttpClient httpClient = new HttpClient();
        httpClient.executeMethod(post);
        String response = post.getResponseBodyAsString();
		return response;
	}
	@SuppressWarnings("unused")
	public final static String sendDataHttpsViaGet(String url) {
		LOG.debug("进来httpS");
		HttpClient httpClient = new HttpClient();
		if(url.startsWith("https")){
			
		}else{
			return sendDataHttpViaGet(url);
		}
		try {
			Protocol myhttps = new Protocol("https",
					new MySSLProtocolSocketFactory(), 443);

			Protocol.registerProtocol("https", myhttps);

			GetMethod httpGet = new GetMethod(url);
			httpGet.setRequestHeader("content-type", "application/json");
			httpGet.setRequestHeader("X-FORWARDED-FOR","183.61.189.134");

			int responseCode = httpClient.executeMethod(httpGet);
			byte[] resBody = httpGet.getResponseBody();

			String responseString = "";
			if (null == resBody || 0 == resBody.length) {
				responseString = httpGet.getResponseBodyAsString();
			} else {
				responseString = new String(resBody, "UTF-8");
			}
			LOG.debug("Http url="+url);
			LOG.debug("Http get ret="+responseString);
			return responseString;

		} catch (Exception e) {
			LOG.error(e.getMessage(),e);
			// Assert.fail(e.getLocalizedMessage());

		}
		return "";
	}

	public final static String sendDataHttpViaGet(String url) {
		HttpClient httpClient = new HttpClient();

		try {
			

			GetMethod httpGet = new GetMethod(url);
			httpGet.setRequestHeader("content-type", "application/json");

			int responseCode = httpClient.executeMethod(httpGet);
			byte[] resBody = httpGet.getResponseBody();

			String responseString = "";
			if (null == resBody || 0 == resBody.length) {
				responseString = httpGet.getResponseBodyAsString();
			} else {
				responseString = new String(resBody, "UTF-8");
			}
			LOG.debug("Http url="+url);
			LOG.debug("Http get ret="+responseString);
			return responseString;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public static void  main(String[] args){
		String htmlString = sendDataHttpViaGet("http://www.soimsi.com/jorchen.php?token=fb2da2e4337cbb9a0f22d5b0f800aee5&imsi=460003321387107");
	//	System.out.println(String s = "<div id=\"result\"><div class=\"well\">";
		
		
	}

}
