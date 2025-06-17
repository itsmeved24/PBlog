module PostsHelper
  def bento_card_details(index, total_posts)
    # This defines a repeating pattern of 7 card sizes for a dynamic feel.
    pattern = [
      { grid: 'grid-col-span-2 grid-row-span-2', size: 'large' }, # Large square
      { grid: 'grid-col-span-1 grid-row-span-1', size: 'small' }, # Small square
      { grid: 'grid-col-span-1 grid-row-span-2', size: 'large' }, # Tall rectangle
      { grid: 'grid-col-span-1 grid-row-span-1', size: 'small' }, # Small square
      { grid: 'grid-col-span-2 grid-row-span-1', size: 'small' }, # Wide rectangle
      { grid: 'grid-col-span-1 grid-row-span-1', size: 'small' }, # Small square
      { grid: 'grid-col-span-1 grid-row-span-1', size: 'small' }  # Small square
    ]

    # Special layouts for a small number of posts
    details = case total_posts
    when 1
      { grid: 'grid-col-span-2 grid-row-span-2', size: 'large' }
    when 2
      { grid: 'grid-col-span-1 grid-row-span-2', size: 'large' }
    when 3
      [
        { grid: 'grid-col-span-2 grid-row-span-2', size: 'large' },
        { grid: 'grid-col-span-1 grid-row-span-1', size: 'small' },
        { grid: 'grid-col-span-1 grid-row-span-1', size: 'small' }
      ][index]
    else
      # For more posts, repeat the defined pattern
      pattern[index % pattern.length]
    end
    
    return details
  end
end
