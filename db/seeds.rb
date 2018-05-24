(6..100).each do |iterator|
  Book.create({
    :id => iterator,
    :title => 'By Invitation Only BAM Exclusive',
    :synopsis => 'The Lowcountry of South Carolina is where By Invitation Only begins at a barbecue engagement party thrown by Diane English Stiftel, her brother Floyd, and her parents to celebrate her son’s engagement. On this gorgeous, magical night, the bride’s father, Alejandro Cambria, a wealthy power broker whose unbelievably successful career in private equity made him one of Chicago’s celebrated elite, discovers the limits and possibilities of cell phone range. While the mother of the bride, Susan Kennedy Cambria, who dabbles in the world of public relations and believes herself deserving of every square inch of her multimillion-dollar penthouse and imaginary carrara marble pedestal, learns about moonshine and dangerous liaisons. ',
    :author => 'Dorothea Benton Frank',
    :image => File.new(File.join(Rails.root, 'dummy_cover', '0062873520_b.jpg'))
  })
end
