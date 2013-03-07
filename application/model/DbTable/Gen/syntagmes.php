<?php
/**
 * Ce fichier contient la classe Gen_syntagmes.
 *
 * @copyright  2013 Samuel Szoniecky
 * @license    "New" BSD License
 */

class Model_DbTable_Gen_syntagmes extends Zend_Db_Table_Abstract
{
    
    /**
     * Nom de la table.
     */
    protected $_name = 'gen_syntagmes';
    
    /**
     * Clef primaire de la table.
     */
    protected $_primary = 'id_syn';

    protected $_referenceMap    = array(
        'Lieux' => array(
            'columns'           => 'id_lieu',
            'refTableClass'     => 'Models_DbTable_Gevu_lieux',
            'refColumns'        => 'id_lieu'
        )
    );	
    
    /**
     * Vérifie si une entrée Gen_syntagmes existe.
     *
     * @param array $data
     *
     * @return integer
     */
    public function existe($data)
    {
		$select = $this->select();
		$select->from($this, array('id_syn'));
		foreach($data as $k=>$v){
			$select->where($k.' = ?', $v);
		}
	    $rows = $this->fetchAll($select);        
	    if($rows->count()>0)$id=$rows[0]->id_syn; else $id=false;
        return $id;
    } 
        
    /**
     * Ajoute une entrée Gen_syntagmes.
     *
     * @param array $data
     * @param boolean $existe
     *  
     * @return integer
     */
    public function ajouter($data, $existe=true)
    {
    	
    	$id=false;
    	if($existe)$id = $this->existe($data);
    	if(!$id){
    	 	$id = $this->insert($data);
    	}
    	return $id;
    } 
           
    /**
     * Recherche une entrée Gen_syntagmes avec la clef primaire spécifiée
     * et modifie cette entrée avec les nouvelles données.
     *
     * @param integer $id
     * @param array $data
     *
     * @return void
     */
    public function edit($id, $data)
    {        
   	
    	$this->update($data, 'gen_syntagmes.id_syn = ' . $id);
    }
    
    /**
     * Recherche une entrée Gen_syntagmes avec la clef primaire spécifiée
     * et supprime cette entrée.
     *
     * @param integer $id
     *
     * @return void
     */
    public function remove($id)
    {
    	$this->delete('gen_syntagmes.id_syn = ' . $id);
    }

    /**
     * Recherche les entrées de Gen_syntagmes avec la clef de lieu
     * et supprime ces entrées.
     *
     * @param integer $idLieu
     *
     * @return void
     */
    public function removeLieu($idLieu)
    {
		$this->delete('id_lieu = ' . $idLieu);
    }
    
    /**
     * Récupère toutes les entrées Gen_syntagmes avec certains critères
     * de tri, intervalles
     */
    public function getAll($order=null, $limit=0, $from=0)
    {
   	
    	$query = $this->select()
                    ->from( array("gen_syntagmes" => "gen_syntagmes") );
                    
        if($order != null)
        {
            $query->order($order);
        }

        if($limit != 0)
        {
            $query->limit($limit, $from);
        }

        return $this->fetchAll($query)->toArray();
    }

    
    	/**
     * Recherche une entrée Gen_syntagmes avec la valeur spécifiée
     * et retourne cette entrée.
     *
     * @param int $id_syn
     *
     * @return array
     */
    public function findById_syn($id_syn)
    {
        $query = $this->select()
                    ->from( array("g" => "gen_syntagmes") )                           
                    ->where( "g.id_syn = ?", $id_syn );

        return $this->fetchAll($query)->toArray(); 
    }
    	/**
     * Recherche une entrée Gen_syntagmes avec la valeur spécifiée
     * et retourne cette entrée.
     *
     * @param int $id_dico
     *
     * @return array
     */
    public function findById_dico($id_dico)
    {
        $query = $this->select()
                    ->from( array("g" => "gen_syntagmes") )                           
                    ->where( "g.id_dico = ?", $id_dico );

        return $this->fetchAll($query)->toArray(); 
    }
    	/**
     * Recherche une entrée Gen_syntagmes avec la valeur spécifiée
     * et retourne cette entrée.
     *
     * @param int $num
     *
     * @return array
     */
    public function findByNum($num)
    {
        $query = $this->select()
                    ->from( array("g" => "gen_syntagmes") )                           
                    ->where( "g.num = ?", $num );

        return $this->fetchAll($query)->toArray(); 
    }
    	/**
     * Recherche une entrée Gen_syntagmes avec la valeur spécifiée
     * et retourne cette entrée.
     *
     * @param int $ordre
     *
     * @return array
     */
    public function findByOrdre($ordre)
    {
        $query = $this->select()
                    ->from( array("g" => "gen_syntagmes") )                           
                    ->where( "g.ordre = ?", $ordre );

        return $this->fetchAll($query)->toArray(); 
    }
    	/**
     * Recherche une entrée Gen_syntagmes avec la valeur spécifiée
     * et retourne cette entrée.
     *
     * @param varchar $lib
     *
     * @return array
     */
    public function findByLib($lib)
    {
        $query = $this->select()
                    ->from( array("g" => "gen_syntagmes") )                           
                    ->where( "g.lib = ?", $lib );

        return $this->fetchAll($query)->toArray(); 
    }
    
    
}
