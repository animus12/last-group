<?php include "db_connect.php" ?>

<?php
	if($_SESSION['login_type'] != 1) {
		?>
			<script>
				window.location.href = "index.php?page=home"
			</script>
		<?php
	}
 ?>

<div class="col-lg-12">
	<div class="card">
		<div class="card-header"><b>Inventory</b></div>
		<div class="card-body">
			<table class="table table-bordered" id="myTable">
				<thead>
					<tr>
						<th class="text-center">#</th>
						<th class="text-center">Item Code</th>
						<th class="text-center">Item Name</th>
						<th class="text-center">Item Size</th>
						<th class="text-center">Item Category</th>
						<th class="text-center">Stock Available</th>
					</tr>
				</thead>
				<tbody>
					<?php
						$i = 1;
						$qry = $conn->query("SELECT * FROM items order by name asc");
						while($row=$qry->fetch_assoc()):
							$inn = $conn->query("SELECT sum(qty) as stock FROM stocks where type = 1 and item_id =".$row['id']);
							$inn = $inn->num_rows > 0 ? $inn->fetch_array()['stock'] :0 ;
							$out = $conn->query("SELECT sum(qty) as stock FROM stocks where type = 2 and item_id =".$row['id']);
							$out = $out->num_rows > 0 ? $out->fetch_array()['stock'] :0 ;
							$available = $inn - $out;
					?>
					<tr>
						<td><?php echo $i++ ?></td>
						<td><?php echo $row['item_code'] ?></td>
						<td><?php echo ucwords($row['name']) ?></td>
						<td><?php echo $row['size'] ?></td>
						<td><?php echo $row['category'] ?></td>
						<?php if($available <= 0): ?>
							<td class="bg-danger text-light text-center">Out of Stock</td>
						<?php elseif($available <= 20): ?>
								<td class="bg-warning text-center"><?php echo $available ?></td>
						<?php else: ?>
									<td class="text-center"><?php echo $available ?></td>
						<?php endif; ?>
						<!-- <td class="text-center <?php echo ($available < 100)? "bg-warning": "" ?> <?php echo ($available <= 0)? "bg-danger text-light": "" ?>"><?php echo (number_format($available) <= 0)? "Out of Stock": number_format($available) ?></td> -->
					</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		var table = $('#myTable').DataTable( {
        lengthChange: true,
        buttons: [ 'copy', 'excel', 'pdf', 'colvis' ]
    } );
	})
</script>