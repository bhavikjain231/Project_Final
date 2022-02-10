<aura:application controller="sObjectDetailController" extends="force:slds">
    <aura:attribute name="objName" type="String" default='Contact'/>
    <aura:attribute name="sObjects" type="sObject[]"/>
    <aura:attribute name="fieldNames" type="String[]" default='["Id","Name","Owner.Name"]'/>
    <aura:handler name="init" value="{!this}" action="{!c.doInit}" />
    
   <div class="slds-m-around_small">
        <div class="slds-page-header">
            <div class="slds-media">
                <div class="slds-media__body">
                    <div class="slds-box slds-theme_shade">
                        <p> <h1>Ligtning Component Dynamic Field Binding.</h1></p>
                    </div>
                    <br/><br/>
                    <p class="slds-text-body_small slds-line-height_reset">
                        <div class="slds-table--header-fixed_container" style="height:450px;">
                            <div class="slds-scrollable_y" style="height:100%;">
                                <table class="slds-table slds-table_bordered slds-table_cell-buffer slds-table_col-bordered slds-table_striped">
                                    <thead>
                                        <tr class="slds-text-title_caps">
                                            <aura:iteration items="{!v.fieldNames}" var="fieldName">
                                                <th scope="col">
                                                    <div title="{!fieldName}">{!fieldName}</div>
                                                </th>
                                            </aura:iteration>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <aura:iteration items="{!v.sObjects}" var="object">
                                            <tr>
                                                <aura:iteration items="{!v.fieldNames}" var="fieldName">
                                                    <th scope="row" data-label="{!fieldName}">
                                                        <div class="">
                                                            <c:SobjectComponent objName="{!object}" fieldName="{!fieldName}"/>
                                                        </div>
                                                    </th>
                                                </aura:iteration>
                                            </tr>
                                        </aura:iteration>                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </p>
                </div>
            </div><br/>
        </div><br/>
    </div> 
</aura:application>