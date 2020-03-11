<script>
            
            var rIndex,
                table1 = document.getElementById("table1");
                table2 = document.getElementById("table2");
                table3 = document.getElementById("table3");
            
            function myfunction(){
            var x = document.getElementById('secu');
            if (x.style.display === "none") {
            x.style.display = "block";
            } else {
            x.style.display = "none";
            }
            }
            // check the empty input
            function checkEmptyInput()
            {
                var isEmpty = false,
                    productName1 = document.getElementById("productName1").value,
                    price1 = document.getElementById("price1").value,
            
                if(productName1 === ""){
                    alert("First Name Cannot Be Empty");
                    isEmpty = true;
                }
                else if(price1 === ""){
                    alert("Last Name Cannot Be Empty");
                    isEmpty = true;
                }
                return isEmpty;
            }
            
            // add Row
            function addHtmlTableRow()
            {
                // get the table by id
                // create a new row and cells
                // get value from input text
                // set the values into row cell's
                if(!checkEmptyInput()){
                var newRow = table1.insertRow(table1.length),
                    cell1 = newRow.insertCell(0),
                    cell2 = newRow.insertCell(1),
                    productName1 = document.getElementById("productName1").value,
                    price1 = document.getElementById("price1").value,
            
                cell1.innerHTML = productName1;
                cell2.innerHTML = price1;
                // call the function to set the event to the new row
                selectedRowToInput();
            }
            }
            
            // display selected row data into input text
            function selectedRowToInput()
            {
                
                for(var i = 1; i < table1.rows.length; i++)
                {
                    table1.rows[i].onclick = function()
                    {
                      // get the seected row index
                      rIndex = this.rowIndex;
                      document.getElementById("productName1").value = this.cells[0].innerHTML;
                      document.getElementById("price1").value = this.cells[1].innerHTML;
                    };
                }
            }
            selectedRowToInput();
            
            function editHtmlTbleSelectedRow()
            {
                var productName1 = document.getElementById("productName1").value,
                    price1 = document.getElementById("price1").value,
               if(!checkEmptyInput()){
                table1.rows[rIndex].cells[0].innerHTML = productName1;
                table1.rows[rIndex].cells[1].innerHTML = price1;
              }
            }
            
            function removeSelectedRow()
            {
                table1.deleteRow(rIndex);
                // clear input text
                document.getElementById("productName1").value = "";
                document.getElementById("price1").value = "";
            }
        </script>