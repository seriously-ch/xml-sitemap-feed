<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:html="http://www.w3.org/TR/REC-html40"
	xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
		xmlns:news="http://www.google.com/schemas/sitemap-news/0.9"
		xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Google News Sitemap Feed</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css">body{font-family:"Lucida Grande","Lucida Sans Unicode",Tahoma,Verdana,sans-serif;font-size:13px}#header,#footer{padding:2px;margin:10px;font-size:8pt;color:gray}a{color:black}td{font-size:11px}th{text-align:left;padding-right:30px;font-size:11px}tr.high{background-color:whitesmoke}#footer img{vertical-align:bottom}</style>
</head>
<body>
	<h1>Google News Sitemap Feed</h1>
	<div id="header">
		<p>This is a <a href="https://support.google.com/news/publisher/answer/75717" target="_blank">Google News Sitemap</a> to aid <a href="https://news.google.com" target="_blank">Google News</a> finding news on your website. Please note that <strong><em>only posts from the last 48 hours</em></strong> will be processed by Google News.</p>
		<p>Follow the guidelines on <a href="https://support.google.com/news/publisher/answer/40787" target="_blank">Getting into Google News</a> and when you're ready, apply for inclusion within the <a href="https://partnerdash.google.com/partnerdash/d/news#p:id=pfehome">Google News Publisher Center</a>.
		For general questions about Google News, please see the <a href="https://groups.google.com/a/googleproductforums.com/forum/#!categories/news/google-news-publishers" target="_blank">Publisher Help Forum</a>.</p>
	</div>
	<div id="content">
		<table cellpadding="5">
			<tr class="high">
				<th>#</th>
				<th>Title</th>
				<th>Language</th>
				<th>Image(s)</th>
				<th>Keyword(s)</th>
				<th>Stock(s)</th>
				<th>Publication Date (GMT)</th>
			</tr>
<xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'"/>
<xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
<xsl:for-each select="sitemap:urlset/sitemap:url">
			<tr><xsl:if test="position() mod 2 != 1"><xsl:attribute  name="class">high</xsl:attribute></xsl:if>
				<td><xsl:value-of select="position()"/></td>
				<td><xsl:variable name="itemURL"><xsl:value-of select="sitemap:loc"/></xsl:variable>
					<a href="{$itemURL}"><xsl:value-of select="news:news/news:title"/></a>
				</td>
				<td><xsl:value-of select="news:news/news:publication/news:language"/></td>
				<td><xsl:value-of select="count(image:image)"/></td>
				<td><xsl:value-of select="news:news/news:keywords"/></td>
				<td><xsl:value-of select="news:news/news:stock_tickers"/></td>
				<td><xsl:value-of select="concat(substring(news:news/news:publication_date,0,11),concat(' ', substring(news:news/news:publication_date,12,8)))"/></td>
			</tr>
</xsl:for-each>
		</table>
	</div>
	<div id="footer">
		<p><img src="data:image/gif;base64,R0lGODlhUAAPAJEAAGZmZv////9mAImOeSwAAAAAUAAPAAACoISPqcvtD0+YtNqLs968myCE4kiW5jkGw8q27gvDwYfWdq3G+i7T9w/M8Ya7GQAUoiSTEyYSKYA2nSKhdXUdCIlaXzRVDVdB0+dS2lJZ1bkt0Sgti6NysvM5jbq2ai2WywJHYrZUaEhIWJXm99foNiRI9XUoV4g4GJjJyEgBGAkEivIIyPUZeppCqorlheo6ulr00UFba3uLEaG7y9urUAAAOw%3D%3D" alt="XML Sitemap" title="XML Sitemap" /> generated by <a href="https://status301.net/wordpress-plugins/xml-sitemap-feed/" title="XML Sitemap Feed plugin for WordPress">XML Sitemap &amp; Google News Feeds</a> running on <a href="https://wordpress.org/">WordPress</a>.</p>
	</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
