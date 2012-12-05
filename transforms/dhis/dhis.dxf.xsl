<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:variable name="year" select="/Lists/@year"/>
  <xsl:variable name="month" select="/Lists/@month"/>
  <xsl:variable name="day" select="/Lists/@day"/>
  <xsl:template match="/">
  
  <dxf  xmlns="http://dhis2.org/schema/dxf/1.0" xmlns:msg="http://www.SDMX.org/resources/SDMXML/schemas/v2_0/message" xmlns:struct="http://www.SDMX.org/resources/SDMXML/schemas/v2_0/structure" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  
    <xsl:apply-templates select="/Lists/List[@name='post']" mode="data_element"/>
    <xsl:apply-templates select="/Lists/List[@name='post']" mode="group_member"/>
    </dxf>
  </xsl:template>
  <!-- output the faciltiy code list-->
  <xsl:template match="List[@name='post']" mode="data_element">
      <dataElements>
      <xsl:for-each select="row">
        <xsl:sort data-type="text" select="field[@column='name']"/>
        <xsl:if test="field[@column='post_id'] != ''">
          <xsl:if test="field[@column='name'] != ''">
            <dataElement>
              <name><xsl:value-of select="normalize-space(field[@column='name'])"/></name>
     <shortName><xsl:value-of select="substring(normalize-space(field[@column='name']),1,25)"/></shortName>
          <id>post<xsl:value-of select="normalize-space(field[@column='post_id'])"/></id>    
          
      <description></description>
      <active>true</active>
      <type>int</type>
      <domainType>aggregate</domainType>
      <aggregationOperator>sum</aggregationOperator>
      <lastUpdated><xsl:value-of select="$year"/>-<xsl:value-of select="$month"/>-<xsl:value-of select="$day"/>
      </lastUpdated>
                 </dataElement>
          </xsl:if>
        </xsl:if>
      </xsl:for-each>
      </dataElements>
    </xsl:template>
    
      <xsl:template match="List[@name='post']" mode="group_member">
      <dataElementGroupMembers>
      <xsl:for-each select="row">
        <xsl:sort data-type="text" select="field[@column='name']"/>
        <xsl:if test="field[@column='post_id'] != ''">
          <xsl:if test="field[@column='name'] != ''">
            <dataElementGroupMember>
            <dataElementGroup>20</dataElementGroup> <!--get id from dhis to be changed when moving to another dhis instance -->
      		<dataElement>post<xsl:value-of select="normalize-space(field[@column='post_id'])"/></dataElement>
                 </dataElementGroupMember>
          </xsl:if>
        </xsl:if>
      </xsl:for-each>
      </dataElementGroupMembers>
    </xsl:template>
    
</xsl:stylesheet>



