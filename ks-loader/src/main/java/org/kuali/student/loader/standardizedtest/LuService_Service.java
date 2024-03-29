
/*
 * 
 */
package org.kuali.student.loader.standardizedtest;

import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;

import org.kuali.student.r2.lum.clu.service.CluService;
/**
 * This class was generated by Apache CXF 2.2.10
 * Wed Sep 08 11:26:43 EDT 2010
 * Generated source version: 2.2.10
 * 
 */
@WebServiceClient (name = "LuService",
                   wsdlLocation =
                   "file:/C:/java/training/ks/ks-api/ks-enroll-api/src/main/resources/META-INF/wsdl/LuService.wsdl",
                   targetNamespace = "http://student.kuali.org/wsdl/lu")
public class LuService_Service extends Service
{

 public final static URL WSDL_LOCATION;
 public final static QName SERVICE = new QName (
   "http://student.kuali.org/wsdl/lu", "LuService");
 public final static QName CluServicePort = new QName (
   "http://student.kuali.org/wsdl/lu", "LuServicePort");

 static
 {
  URL url = null;
  try
  {
   url =
   new URL (
     "file:/C:/java/training/ks/ks-api/ks-enroll-api/src/main/resources/META-INF/wsdl/LuService.wsdl");
  }
  catch (MalformedURLException e)
  {
   System.err.println (
     "Can not initialize the default wsdl from file:/C:/java/training/ks/ks-api/ks-enroll-api/src/main/resources/META-INF/wsdl/CluService.wsdl");
   // e.printStackTrace();
  }
  WSDL_LOCATION = url;
 }

 public LuService_Service (URL wsdlLocation)
 {
  super (wsdlLocation, SERVICE);
 }

 public LuService_Service (URL wsdlLocation, QName serviceName)
 {
  super (wsdlLocation, serviceName);
 }

 public LuService_Service ()
 {
  super (WSDL_LOCATION, SERVICE);
 }

 /**
  *
  * @return
  *     returns LuService
  */
 @WebEndpoint (name = "CluServicePort")
 public CluService getCLuServicePort ()
 {
  return super.getPort (CluServicePort, CluService.class);
 }

 /**
  *
  * @param features
  *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
  * @return
  *     returns LuService
  */
 @WebEndpoint (name = "LuServicePort")
 public CluService getCluServicePort (WebServiceFeature... features)
 {
  return super.getPort (CluServicePort, CluService.class, features);
 }
}
