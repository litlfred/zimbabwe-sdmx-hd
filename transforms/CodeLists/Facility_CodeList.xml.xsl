<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates select="/Lists/List[@name='Organisation units']"/>
  </xsl:template>

  <!-- output the faciltiy code list-->
  <xsl:template match="List">
    <CodeList id="CL_FACILITY" agencyID="ZW_MOHCW" version="1.0" isFinal="false">
      <Name xml:lang="en">Facility</Name>
      <xsl:for-each select="row">
        <xsl:sort data-type="text" select="field[@column='Short name']"/>
        <xsl:if test="field[@column='Code'] != ''">
          <xsl:if test="field[@column='Short name'] != ''">
            <Code>
              <xsl:attribute name="value">
                <xsl:value-of select="normalize-space(field[@column='Code'])"/>
              </xsl:attribute>
              <Description>
                <xsl:value-of select="normalize-space(field[@column='Short name'])"/>
              </Description>
            </Code>
          </xsl:if>
        </xsl:if>
      </xsl:for-each>
    </CodeList>
  </xsl:template>

</xsl:stylesheet>



