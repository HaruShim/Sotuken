from django.db import models

class IgMstProduct(models.Model):
    id = models.AutoField(primary_key=True)
    product_nm = models.CharField(max_length=60, blank=True, null=True)
    brand_cd = models.ForeignKey('IgMstBrand',on_delete=models.SET_NULL, null=True, db_column='brand_cd')
    product_url = models.TextField(blank=True, null=True)
    class Meta:
        db_table = 'ig_mst_product'

class IgMstBrand(models.Model):
    brand_cd = models.CharField(max_length=60, blank=True, null=True)

    class Meta:
        db_table = 'ig_mst_brand'