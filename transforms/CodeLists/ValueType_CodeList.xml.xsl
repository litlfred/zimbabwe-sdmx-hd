<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates select="/Lists/List[@name='value_type']"/>
  </xsl:template>

  <!-- output the faciltiy code list-->
  <xsl:template match="List">
    <CodeList id="CL_VALUE_TYPE" agencyID="ZW_MOHCW" version="1.0" isFinal="false">
      <Name xml:lang="en">Job</Name>
      <xsl:for-each select="row">
        <xsl:sort data-type="number" select="field[@column='sdmxhdname']"/>
        <xsl:if test="field[@column='sdmxhdid'] != ''">
          <xsl:if test="field[@column='sdmxhdname'] != ''">
            <Code>
              <xsl:attribute name="value">
                <xsl:value-of select="normalize-space(field[@column='sdmxhdid'])"/>
              </xsl:attribute>
              <Description>
                <xsl:value-of select="normalize-space(field[@column='sdmxhdname'])"/>
              </Description>
            </Code>
          </xsl:if>
        </xsl:if>
      </xsl:for-each>
    </CodeList>
  </xsl:template>

</xsl:stylesheet>



