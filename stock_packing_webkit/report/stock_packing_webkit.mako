<html>
<head>
    <style type="text/css">
        ${css}
        pre {font-family:helvetica; font-size:12;}
    </style>
</head>
<body>
    <style  type="text/css">
     table {
       width: 100%;
       page-break-after:auto;
       border-collapse: collapse;
       cellspacing="0";
       font-size:10px;
           }
     td { margin: 0px; padding: 3px; border: 1px solid lightgrey;  vertical-align: top; }
     pre {font-family:helvetica; font-size:13;}
    </style>
    %for pick in objects :
<br>
    <% setLang(pick.partner_id.lang) %>
    <table >
        %if pick.company_id.address_label_position == 'left':
         <tr>
         <td style="width:50%">
${_("Shipping Address")}   
<hr>
           <pre>
${pick.address_id.address_label}
           <pre>
         </td>
         <td style="width:50%">
         %if pick.address_id.phone :
${_("Phone")}: ${pick.address_id.phone|entity} <br>
        %endif
        %if pick.address_id.fax :
${_("Fax")}: ${pick.address_id.fax|entity} <br>
        %endif
        %if pick.address_id.email :
${_("Mail")}: ${pick.address_id.email|entity} <br>
        %endif
        %if pick.partner_id.vat :
${_("VAT")}: ${pick.partner_id.vat|entity} <br>
        %endif
   
         </td>

        </tr>
        %endif

        %if pick.company_id.address_label_position == 'right' or not pick.company_id.address_label_position:
         <tr>
         <td style="width:50%">
         %if pick.address_id.phone :
${_("Tel")}: ${pick.address_id.phone|entity} <br>
        %endif
        %if pick.address_id.fax :
${_("Fax")}: ${pick.address_id.fax|entity} <br>
        %endif
        %if pick.address_id.email :
${_("E-mail")}: ${pick.address_id.email|entity} <br>
        %endif
        %if pick.partner_id.vat :
${_("VAT")}: ${pick.partner_id.vat|entity} <br>
        %endif

         </td>
         <td style="width:50%">
${_("Shipping Address")}
<hr>
           <pre>
${pick.address_id.address_label}
           <pre>
         </td>
        </tr>
        %endif
    </table>

    <br />
    <br />

    %if pick.type == 'out' :
    <span class="title">${_("Delivery Out")} ${pick.name or ''|entity}</span>
    %elif pick.type == 'in' :
    <span class="title">${_("Delivery In")} ${pick.name or ''|entity}</span>   
    %elif pick.type == 'production' :
    <span class="title">${_("Production")} ${pick.name or ''|entity}</span> 
    %elif pick.type == 'delivery' :
    <span class="title">${_("Delivery")} ${pick.name or ''|entity}</span> 
    %elif pick.type == 'internal' :
    <span class="title">${_("Internal Packing")} ${pick.name or ''|entity}</span> 
    %endif
%if pick.state != 'done':
   <span class="title"> ${pick.state} </span>
%endif 
    <br/>
    <br/>
    <table  style="width:100%">
        <tr>
          %if pick.origin and pick.origin not in [ pick.sale_id.name,pick.purchase_id.name]  :
            <td>${_("Document")}</td>
          %endif
            <td style="white-space:nowrap">${_("Packing Date")}</td>
          %if pick.carrier_id:
            <td style="white-space:nowrap">${_("Carrier")}</td>
          %endif
          %if pick.sale_id or pick_purchase_id:
            <td style="white-space:nowrap">${_("Reference")}</td>
          %endif
          %if pick.sale_id and pick.sale_id.client_order_ref :
            <td style="white-space:nowrap">${_("Client Ref")}</td>
          %endif
        </tr>
        <tr>
            %if pick.origin and pick.origin not in [ pick.sale_id.name,pick.purchase_id.name]  :
            <td>
               ${pick.origin}
            </td>
            %endif
             <td>
            %if pick.max_date:
               ${pick.max_date and pick.max_date[:10] or ''}</td>
            %endif
            %if pick.carrier_id:
             <td>
               ${pick.carrier_id.name }
             </td>
           %endif
           %if pick.sale_id or pick_purchase_id:
             <td>${pick.sale_id.name or pick.purchase_id.name or ''}</td>
           %endif
          %if pick.sale_id and pick.sale_id.client_order_ref :
            <td style="white-space:nowrap">${pick.sale_id.client_order_ref}</td>
          %endif
    </table>
    <h1><br /></h1>
    <table style="width:100%">
        <thead>
          <tr>
            <th>${_("Description")}</th>
%if pick.print_uom:
            <th style="text-align:center;">${_("Quantity")}</th><th class style="text-align:left;">${_("UoM")}</th>
%endif
%if pick.print_uos:
            <th style="text-align:center;white-space:nowrap">${_("UoS Qty")}</th><th style="text-align:left;white-space:nowrap;">${_("UoS")}</th>
%endif
%if pick.print_ean:
            <th style="text-align:center;">${_("EAN")}</th>
%endif
%if pick.print_lot:
            <th style="text-align:center;">${_("Lot")}</th>
%endif
%if pick.print_packing:
            <th style="text-align:center;">${_("Pack")}</th>
            <th style="text-align:center;">${_("Packaging")}</th>
%endif
            <th style="text-align:center;">${_("Source Location")}</th>
            <th style="text-align:center;">${_("Destination Location")}</th>
         </tr>
        </thead>
        %for line in pick.move_lines :
        <tbody>
        <tr>
           <td>${line.name|entity}</td>
%if pick.print_uom:
           <td style="white-space:nowrap;text-align:right;">${str(line.product_qty).replace(',000','') or '0'}</td>
           <td style="white-space:nowrap;text-align:left;">${line.product_uom.name or ''}</td>
%endif
%if pick.print_uos:
           <td style="white-space:nowrap;text-align:right;">${str(line.product_uos_qty).replace(',000','') or '0'}</td>
           <td style="white-space:nowrap;text-align:left;">${line.product_uos.name or ''}</td>
%endif
%if pick.print_ean:
           <td style="white-space:nowrap;text-align:left;">${line.product_packaging.ean or line.product_id.ean13 or ''}</td>
%endif
%if pick.print_lot:
           <td style="white-space:normal;text-align:left;">${line.prodlot_id.name or '' }</td>
%endif
%if pick.print_packing:
           <td style="white-space:normal;text-align:left;">${line.product_packaging.qty and line.product_qty/line.product_packaging.qty or ''}</td>
           <td style="white-space:normal;text-align:left;">${line.product_packaging and line.product_packaging.ul.name or ''} ${line.product_packaging and _(" / " or '')} ${line.product_packaging and line.product_packaging.qty or ''} ${line.product_packaging and line.product_id.uom_id.name or ''}</td>
%endif
           <td style="white-space:nowrap;text-align:left;">${line.location_id.name or ''}</td>
           <td style="white-space:nowrap;text-align:left;">${line.location_dest_id.name or ''}</td>
        </tr>
        %if line.note :
        <tr><td colspan="6" style="border-style:none"><style="font-family:Helvetica;padding-left:20px;font-size:10;"white-space:normal;">${line.note |entity}</pre></td></tr>
        %endif
        %endfor
        </tbody>
    </table>

%if pick.note and 'note_print' not in pick._columns:
<br>
    <pre>${pick.note}</pre>
%endif:
%if 'note_print' in pick._columns and pick.note_print:
<br>
    <pre>${pick.note_print}</pre>
%endif:

%if 'tractor_gross' in pick._columns and pick.tractor_gross:
<br>
    <table style="text-align:right;border:1px solid grey;width:40%">
        <tr style="text-align:right;border:1px solid grey;">
            <th/> 
            <th>${_("Tractor")}</th>  
            <th>${_("Trailer")}</th> 
            <th>${_("Total")}</th> 
        </tr>
        <tr>
            <td style="text-align:left;">${_("License Plate")}</td>
            <td>${ pick.tractor_number or ''}</td>
            <td>${ pick.trailer_number or ''}</td>
            <td/>
        </tr>
        <tr>
            <td style="text-align:left;">${_("Net")}</td>
            <td>${ formatLang(pick.tractor_net or '')}</td>
            <td>${ formatLang(pick.trailer_net or '')}</td>
            <td>${ formatLang(pick.total_net or '')}</td>
        </tr>
        <tr>
            <td style="text-align:left;">${_("Tare")}</td>
            <td >${ formatLang(pick.tractor_tare or '')}</td>
            <td i>${ formatLang(pick.trailer_tare or '') }</td>
            <td/>
        </tr>
        <tr>
            <td style="text-align:left;">${_("Gross")}</td>
            <td >${ formatLang(pick.tractor_gross or '')}</td>
            <td >${ formatLang(pick.trailer_gross or '') }</td>
            <td>${ formatLang(pick.total_gross or '')}</td>
        </tr>
    </table>
%endif       

    <p style="page-break-after:always"></p>
    %endfor 
</body>
</html>