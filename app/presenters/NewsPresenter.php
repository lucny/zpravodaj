<?php
namespace App\Presenters;

use Nette,
    Nette\Application\UI\Form;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of NewsPresenter
 *
 * @author maturita
 */
class NewsPresenter extends BasePresenter {
    //put your code here
    private $database;

    public function __construct(Nette\Database\Context $database) {
        $this->database = $database;
    }

    public function renderShow($newsId) {
        $news = $this->database->table('news')
                               ->get($newsId);
        if (!$news) {
            $this->error('Stránka nebyla nalezena');
        }
        $this->template->users = $this->database->table('users');
        $this->template->news = $news;
        $this->template->comments = $news->related('comment')
                                         ->order('created_at');
    }
    
}
