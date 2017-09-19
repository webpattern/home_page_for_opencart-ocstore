<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">

    <div class="top_content">
        <?php echo $content_top; ?>
    </div>

    <?php if ($products) { ?>
      <div style="margin-top: 15px;" class="row">
        <div class="col-md-2 col-sm-6 hidden-xs">
          <div class="btn-group btn-group-sm">
            <button onclick="listFunc();" type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button onclick="gridFunc();" type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>

        <div class="col-md-3 col-sm-6">
          <div class="form-group">
            <a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-link"><?php echo $text_compare; ?></a>
          </div>
        </div>

        <div class="col-md-3 col-xs-6">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-limit"><?php echo 'Показывать:'; ?></label>
            <select id="input-limit" class="form-control" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
      </div>

    <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12">
          <div style="height: 330px;" class="product-thumb">
            <div class="delivery">
                <?php if ($product['rating']) { ?>
                <div class="rating rating_home">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } else { ?>
                <div style="height: 30px;"></div>
                <?php } ?>

                <div class="delivery_self">
                    <span class="delivery_self_span">Самовывоз:</span>
                    <a href="#">Сегодня</a>
                </div>
                <div class="delivery_courier">
                    <span class="delivery_courier_span">Курьером:</span>
                    <span>21 сентября</span>
                </div>
            </div>

        <div>
            <?php if ($product['price']) { ?>
            <p class="price price_home">
              <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
              <?php } else { ?>
               <span style="font-size: 10px;" class="price-old"><?php echo $product['price']; ?></span>
               <span class="price-new"><?php echo $product['special']; ?></span>
              <?php } ?>
                <!--<?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>-->
            </p>
            <?php } ?>
        </div>

            <div class="block_name_rating_buttons">
            <h4 style="text-align: center;"><a style="color: #3cadad;" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            </h4>
                <div style="width: 90%;" class="button-group">
                    <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                </div>
            </div>
            <!--<div>
              <div style="min-height: 60px;" class="caption">     
                <!--<p><?php echo $product['description']; ?></p>
              </div>
            </div> -->
            <div style="height: 125px;" class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <p class="description_home"><?php echo $product['description']; ?></p>
          </div>
        </div>
        <?php } ?>
    </div>
    <?php } ?>

      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>

    </div>
    <div class="col-sm-12"><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

<script type="text/javascript">
    var delivery_self = document.getElementsByClassName('delivery_self');
    $('span.delivery_self_span').before('<img style="width: 20px; height: 20px;" class="img_delivery_self" src="/image/cart.jpg"><img>');
    $('span.delivery_courier_span').before('<img style="width: 20px; height: 20px;" class="img_delivery_courier" src="/image/delivery.jpg"><img>');

    $('div.block_name_rating_buttons').addClass('col-sm-3');


    function gridFunc(argument) {
        $('div.block_name_rating_buttons').removeClass('block_name_rating_buttons').removeClass('col-sm-3').addClass('col-sm-12').addClass('block_list');
        $('p.description_home_visible').removeClass('description_home_visible').addClass('description_home');
        $('div.delivery_list').removeClass('delivery_list').addClass('delivery');
        $('div.product-thumb').removeClass('product-thumb-list');
        $('div.product-grid').removeClass('col-md-4').addClass('col-md-3').removeClass('col-lg-4').addClass('col-lg-3');
    }

    function listFunc(argument) {
        $('div.block_list').removeClass('block_list').removeClass('col-sm-12').addClass('block_name_rating_buttons').addClass('col-sm-3');
        $('p.description_home').removeClass('description_home').addClass('description_home_visible');
        $('div.delivery').removeClass('delivery').addClass('delivery_list');
        $('div.product-thumb').addClass('product-thumb-list');

    }
</script>



