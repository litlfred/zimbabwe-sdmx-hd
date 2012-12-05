<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
  <dxf>
    <xsl:apply-templates select="/Lists/List[@name='post']"/>
    <xsl:apply-templates select="/Lists/List[@name='post']" mode="group_member"/>
    </dxf>
  </xsl:template>
  <!-- output the faciltiy code list-->
  <xsl:template match="List">
      <dataElements>
      <xsl:for-each select="row">
        <xsl:sort data-type="text" select="field[@column='name']"/>
        <xsl:if test="field[@column='post_id'] != ''">
          <xsl:if test="field[@column='name'] != ''">
            <dataElement>
              <name><xsl:value-of select="normalize-space(field[@column='name'])"/></name>
     <shortName><xsl:value-of select="substring(normalize-space(field[@column='name']),1,25)"/></shortName>
          <id>hris_id<xsl:value-of select="normalize-space(field[@column='post_id'])"/></id>    
          
      <description></description>
      <active>true</active>
      <type>int</type>
      <domainType>aggregate</domainType>
      <aggregationOperator>sum</aggregationOperator>
      <lastUpdated><xsl:value-of select="/Lists[@year]"/>-<xsl:value-of select="/Lists[@month]"/>-<xsl:value-of select="/Lists[@day]"/></lastUpdated>
                 </dataElement>
          </xsl:if>
        </xsl:if>
      </xsl:for-each>
      </dataElements>
    </xsl:template>
    
     <xsl:template match="List" mode="group_member">
      <dataElementGroupMembers>
      <xsl:for-each select="row">
        <xsl:sort data-type="text" select="field[@column='name']"/>
        <xsl:if test="field[@column='post_id'] != ''">
          <xsl:if test="field[@column='name'] != ''">
            <dataElementGroupMember>
            <dataElementGroup>26</dataElementGroup> <!--get id from dhis to be changed when moving to another dhis instance -->
      		<dataElement>hris_id<xsl:value-of select="normalize-space(field[@column='post_id'])"/></dataElement>
                 </dataElementGroupMember>
          </xsl:if>
        </xsl:if
      </xsl:for-each>
      </dataElementGroupMembers>
    </xsl:template>
    
</xsl:stylesheet>



