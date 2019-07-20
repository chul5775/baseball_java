	var jQuery = jQuery.noConflict();
		jQuery(document).ready(function(){
			jQuery('#name1').click(function(){
				jQuery.ajax({
					url: './src/jsp/1.jsp',
					type: 'POST',
					dataType: 'text',
					success: function(data) {
						console.log('Success send to data!');
						jQuery('#main').html(data);
					},
					error: function(error) {
						console.log('Fail send to data!');
						alert('기능에 문제가 발생하였습니다. 다시 시도해주시길 바랍니다.');
					}
				});
			});
			
			jQuery('#name2').click(function(){
				jQuery.ajax({
					url: './src/jsp/3.jsp',
					type: 'POST',
					dataType: 'text',
					success: function(data) {
						console.log('Success send to data!');
						jQuery('#main').html(data);
					},
					error: function(error) {
						console.log('Fail send to data!');
						alert('기능에 문제가 발생하였습니다. 다시 시도해주시길 바랍니다.');
					}
				});
			});
			
			
			
			
			jQuery("#menu-toggle").click(function(e) {
		      	e.preventDefault();
		      	jQuery("#wrapper").toggleClass("toggled");
		    });
		});
