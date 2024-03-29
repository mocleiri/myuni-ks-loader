/*
 * Copyright 2010 The Kuali Foundation
 *
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may	obtain a copy of the License at
 *
 * 	http://www.osedu.org/licenses/ECL-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.student.loader.search;

/**
 *
 * @author nwright
 */
public class OrgResultGeneric
{
 private String orgId;
 private String shortName;
 private String longName;
 private String type;

 public String getLongName ()
 {
  return longName;
 }

 public void setLongName (String longName)
 {
  this.longName = longName;
 }

 public String getOrgId ()
 {
  return orgId;
 }

 public void setOrgId (String orgId)
 {
  this.orgId = orgId;
 }

 public String getShortName ()
 {
  return shortName;
 }

 public void setShortName (String shortName)
 {
  this.shortName = shortName;
 }

 public String getType ()
 {
  return type;
 }

 public void setType (String type)
 {
  this.type = type;
 }

 
}
