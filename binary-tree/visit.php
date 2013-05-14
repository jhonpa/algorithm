<?PHP
class Node
{
  public $value, $left, $right;
  
  public function Node($value = null, $left = null, $right = null)
  {
    $this->value = $value;
    $this->left = $left;
    $this->right = $right;
  }    

}

function insert($node, $value)
{
  if($node == null){
    return new Node($value);
  }
  if($node->value > $value){
    $node->left = insert($node->left, $value);
  }else{
    $node->right = insert($node->right, $value);
  }
  return $node;
}

function visit($node, $order){
  if($node == null){
    return false;
  }
  switch($order){    
  case "preorder":
    echo $node->value."\n";
    visit($node->left, $order);
    visit($node->right, $order);
    break;
  case "inorder":
    visit($node->left, $order);
    echo $node->value."\n";
    visit($node->right, $order);
    break;
  case "postorder":
    visit($node->left, $order);
    visit($node->right, $order);
    echo $node->value."\n";
    break;
  }
}

$root = null;
foreach(array(5,3,4, 12, 15) as $v){
  $root = insert($root, $v);
}

foreach(array("preorder", "inorder", "postorder") as $v){
  visit($root, $v);
}

?>