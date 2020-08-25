<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\helpers\FileHelper;
use common\models\LoginForm;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['index', 'login', 'error', 'generate-pos'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * Login action.
     *
     * @return string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    public function actionGeneratePos() {

        $post = Yii::$app->request->post();

        try {

            $srcDir = dirname(Yii::getAlias('@root')) . '/template';
            
            if (!file_exists($srcDir . '/assets')) mkdir($srcDir . '/assets');
            if (!file_exists($srcDir . '/admin/assets')) mkdir($srcDir . '/admin/assets');
                        
            $destDir = dirname(Yii::getAlias('@root')) . '/app/' . $post['restaurant_id'];

            FileHelper::copyDirectory($srcDir, $destDir, [

                'afterCopy' => function($from, $to) {

                    //echo "Copy success from " . $from . ' to ' . $to . "\n";

                    return true;
                }
            ]);

            $file = file_get_contents($destDir . '/engine/common/config/bootstrap-local.php');

            if ($file !== FALSE) {

                $file = str_replace('<generatedId>', $post['restaurant_id'], $file);
                file_put_contents($destDir . '/engine/common/config/bootstrap-local.php', $file);
            }

            $file = file_get_contents($destDir . '/engine/common/config/main-local.php');

            if ($file !== FALSE) {

                $file = str_replace('<generatedId>', $post['restaurant_id'], $file);
                $file = str_replace('<generatedDbUsername>', Yii::$app->params['database']['user'], $file);
                $file = str_replace('<generatedDbPassword>', Yii::$app->params['database']['password'], $file);
                file_put_contents($destDir . '/engine/common/config/main-local.php', $file);
            }

        } catch (\yii\base\InvalidParamException $e) {

            echo $e->getTraceAsString();
        }

        try {
            $db = new \yii\db\Connection([
                'dsn' => 'mysql:host=localhost',
                'username' => Yii::$app->params['database']['user'],
                'password' => Yii::$app->params['database']['password'],
                'charset' => 'utf8',
            ]);

            $db->createCommand('CREATE DATABASE ' . $post['restaurant_id'])->execute();
        } catch (\Exception $e) {
            echo $e->getMessage();
        }

        try {
            $db = new \yii\db\Connection([
                'dsn' => 'mysql:host=localhost;dbname=' . $post['restaurant_id'],
                'username' => Yii::$app->params['database']['user'],
                'password' => Yii::$app->params['database']['password'],
                'charset' => 'utf8',
            ]);

            $file = file_get_contents(dirname(Yii::getAlias('@root')) . '/dbtemplate/restotech_template.sql');

            if ($file !== FALSE) {

                $db->createCommand($file)->execute();
            }

            $file = file_get_contents(dirname(Yii::getAlias('@root')) . '/dbtemplate/company_template.sql');

            if ($file !== FALSE) {

                $file = str_replace('<generatedRestaurantName>', $post['restaurant_name'], $file);
                $file = str_replace('<generatedAlamat>', $post['alamat'], $file);
                $file = str_replace('<generatedPhone>', $post['phone'], $file);

                $db->createCommand($file)->execute();
            }
        } catch (\Exception $e) {
            echo $e->getMessage();
        }

        $url = explode('/', trim(Yii::$app->urlManager->createAbsoluteUrl(''), 'http://'));
        array_pop($url);
        array_pop($url);
        array_pop($url);

        $generatedUrl = 'http://';

        foreach ($url as $value) {
            $generatedUrl .= $value . '/';
        }

        return $this->render('generate_pos', [
            'url' => $generatedUrl . 'app/' . $post['restaurant_id']
        ]);
    }
}
