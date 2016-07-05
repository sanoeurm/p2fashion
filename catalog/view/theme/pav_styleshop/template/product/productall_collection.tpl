<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/product/product_filter.tpl" );  ?>    
  
<div class="product-list"> 
	<div class="products-block">
		<?php
		$cols = $MAX_ITEM_ROW ;
		$span = floor(12/$cols);
		$small = floor(12/$MAX_ITEM_ROW_SMALL);
		$mini = floor(12/$MAX_ITEM_ROW_MINI);
		foreach ($products as $i => $product) { ?>
		<?php if( $i++%$cols == 0 ) { ?>
		<div class="row product-items">
		<?php } ?>
		<?php  //echo var_dump($product);exit();?>
		<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-<?php echo $span;?> col-xs-<?php echo $mini;?> product-cols">			
			<div class="product-block">				 
				<div class="product-meta">		  
					<div class="left">
						<h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>	
						<?php if ($product['price']) { ?>
						<div class="price">
							<?php if (!$product['special']) { ?>
								<span class="special-price"><?php echo $product['price']; ?></span>
							<?php } else { ?>
								<span class="price-old"><?php echo $product['price']; ?></span> 
								<span class="price-new"><?php echo $product['special']; ?></span>
							<?php } ?>
							<?php if ($product['tax']) { ?>	        
								<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
							<?php } ?>
						</div>
						<?php } ?>	
					</div>
			  
					<div class="right">		
						<p class="description"><?php echo utf8_substr( strip_tags($product['description']),0,220);?>...</p>
						<div class="product-extra">
							<div class="quantity-adder-all pull-left">
								<div class="quantity-number pull-left">
									<span><?php echo $text_qty; ?></span>
									<input type="text" id="quantity<?php echo $product['product_id'];?>" name="quantity" size="2" value="<?php echo $product['minimum']; ?>" />
								</div>
								<div class="quantity-wrapper pull-left">
									<span class="add-up add-action fa fa-plus"></span> 
									<span class="add-down add-action fa fa-minus"></span>
								</div>					
								<input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>" />	
							</div>	
						</div>
						<div class="action">							
							<div class="cart">						
        						
								<button onclick="addToCart('<?php echo $product['product_id']; ?>', findIdQ(<?php echo $product['product_id']; ?>));" class="btn btn-shopping-cart">
									<i class="fa fa-shopping-cart"></i><span><?php echo $button_cart; ?></span>
								</button>
      						</div>							
						</div>		 
					</div>	 
				</div>		 
			</div>
		</div>
		
		<?php if( $i%$cols == 0 || $i==count($products) ) { ?>
		</div>
		<?php } ?>				
		<?php } ?>
	</div>
</div>
<div class="pagination paging clearfix"><?php echo $pagination; ?></div>