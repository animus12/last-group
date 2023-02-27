<?php include 'db_connect.php' ?>
<style>
   span.float-right.summary_icon {
    font-size: 3rem;
    position: absolute;
    right: 1rem;
    top: 0;
}
.imgs{
		margin: .5em;
		max-width: calc(100%);
		max-height: calc(100%);
	}
	.imgs img{
		max-width: calc(100%);
		max-height: calc(100%);
		cursor: pointer;
	}
	#imagesCarousel,#imagesCarousel .carousel-inner,#imagesCarousel .carousel-item{
		height: 60vh !important;background: black;
	}
	#imagesCarousel .carousel-item.active{
		display: flex !important;
	}
	#imagesCarousel .carousel-item-next{
		display: flex !important;
	}
	#imagesCarousel .carousel-item img{
		margin: auto;
	}
	#imagesCarousel img{
		width: auto!important;
		height: auto!important;
		max-height: calc(100%)!important;
		max-width: calc(100%)!important;
	}
</style>

<div class="container-fluid">
	<div class=" p-5 align-center m-3 rounded bg-info" style="height: calc(100vh - 100px)">
		<div class="row justify-content-center h-100" >
			<div class="row p-0 col-12">
				<div class="col-lg-4 p-2">
					<div class=" d-flex flex-column align-items-center justify-content-center h-100 p-3 bg-light" style="border-radius: 20px;">
						<h2>Monthly income</h2>
						<?php
                      $total = 0;
                      $sales = $conn->query("SELECT * FROM sales s where s.amount_tendered > 0 and date_format(s.date_created,'%Y-%m') = '2023-02' order by unix_timestamp(s.date_created) asc ");
                      if($sales->num_rows > 0) {
								while($row = $sales->fetch_array()) {
									$items = $conn->query("SELECT s.*,i.name,i.item_code as code,i.size  FROM stocks s inner join items i on i.id=s.item_id where s.id in ({$row['inventory_ids']})");
								 while($roww = $items->fetch_array()) {
									 $total += $roww['price']*$roww['qty'];
								 }
								}

							 }

                    ?>

						  <h4 class="text-success"><strong><?php echo number_format($total,2)?></strong></h4>
					</div>
				</div>
				<div class="col-lg-4 p-2">
					<div class="d-flex flex-column align-items-center justify-content-center h-100 p-3 bg-light" style="border-radius: 20px;">
					<h2>Order Per Month</h2>
						<?php
							$totals = 0;
							$sales = $conn->query("SELECT * FROM sales s where s.amount_tendered > 0 and date_format(s.date_created,'%Y-%m') = '2023-02' order by unix_timestamp(s.date_created) asc ");
							if($sales->num_rows > 0) {
							while($row = $sales->fetch_array()) {
								$totals++;
							}
							}
						?>
						<div class=" w-100 justify-content-around d-flex flex-row">
							<h4>Total of:</h4>
							<h4 class=""><strong class="text-success"><?php echo $totals; ?></strong></h4>
						</div>


					</div>
				</div>
				<div class="col-lg-4 p-2">
					<div class="h-100 p-3 bg-light" style="border-radius: 20px;">
						dfdff
					</div>
				</div>
			</div>
			<div class="row p-2 col-12">
				<div class="bg-light w-100 p-3" style="border-radius: 20px;">
					<div id="resizable" style="height: 370px;border:1px solid gray;">
						<div id="chartContainer1" style="height: 100%; width: 100%;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	window.onload = function () {

// Construct options first and then pass it as a parameter
var options1 = {
	animationEnabled: true,
	title: {
		text: ""
	},
	data: [{
		type: "column", //change it to line, area, bar, pie, etc
		legendText: "Try Resizing with the handle to the bottom right",
		showInLegend: true,
		dataPoints: [
			{ y: 6 },
			{ y: 6 },
			{ y: 14 },
			{ y: 12 },
			{ y: 10 },
			{ y: 15 }
			]
		}]
};

$("#resizable").resizable({
	create: function (event, ui) {
		//Create chart.
		$("#chartContainer1").CanvasJSChart(options1);
	},
	resize: function (event, ui) {
		//Update chart size according to its container size.
		$("#chartContainer1").CanvasJSChart().render();
	}
});

}
	$('#manage-records').submit(function(e){
        e.preventDefault()
        start_load()
        $.ajax({
            url:'ajax.php?action=save_track',
            data: new FormData($(this)[0]),
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            success:function(resp){
                resp=JSON.parse(resp)
                if(resp.status==1){
                    alert_toast("Data successfully saved",'success')
                    setTimeout(function(){
                        location.reload()
                    },800)

                }

            }
        })
    })
    $('#tracking_id').on('keypress',function(e){
        if(e.which == 13){
            get_person()
        }
    })
    $('#check').on('click',function(e){
            get_person()
    })
    function get_person(){
            start_load()
        $.ajax({
                url:'ajax.php?action=get_pdetails',
                method:"POST",
                data:{tracking_id : $('#tracking_id').val()},
                success:function(resp){
                    if(resp){
                        resp = JSON.parse(resp)
                        if(resp.status == 1){
                            $('#name').html(resp.name)
                            $('#address').html(resp.address)
                            $('[name="person_id"]').val(resp.id)
                            $('#details').show()
                            end_load()

                        }else if(resp.status == 2){
                            alert_toast("Unknow tracking id.",'danger');
                            end_load();
                        }
                    }
                }
            })
    }
</script>