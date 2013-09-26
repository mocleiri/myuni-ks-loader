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

package org.kuali.student.loader.organization;

import java.util.List;

/**
 *
 * @author nwright
 */
public class PositionRestrictionInputModelCache implements PositionRestrictionInputModel
{

 public PositionRestrictionInputModelCache (PositionRestrictionInputModel loaderModel)
 {
  this.loaderModel = loaderModel;
 }

 private PositionRestrictionInputModel loaderModel;

 public PositionRestrictionInputModel getLoaderModel ()
 {
  return loaderModel;
 }

 public void setLoaderModel (PositionRestrictionInputModel loaderModel)
 {
  this.loaderModel = loaderModel;
 }

 private static List<OrgPositionRestriction> positionRestrictions = null;

 @Override
 public List<OrgPositionRestriction> getOrgPositionRestrictions ()
 {
  if (positionRestrictions != null)
  {
   return positionRestrictions;
  }
  positionRestrictions = loaderModel.getOrgPositionRestrictions ();
  return positionRestrictions;
 }


}
