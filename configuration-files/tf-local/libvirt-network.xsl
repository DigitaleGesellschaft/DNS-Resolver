<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

  <!-- https://libvirt.org/formatnetwork.html#ipv6-nat-based-network -->
  <xsl:template match="/network/forward[@mode='nat']">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
      <nat ipv6='yes'>
        <port start='1024' end='65535'/>
      </nat>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="/network/ip/dhcp">
    <!-- Ignore DHCP -->
  </xsl:template>
</xsl:stylesheet>
