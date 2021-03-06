import os,sys
from django.contrib.messages import constants as messages

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE_DIR, 'apps'))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '_wtcku7tx8bfvqct54n^=cblqnv&6wft*s=kyeqrczm73(100o'    

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    # システムで使用するアプリ
    'home.apps.HomeConfig', # アカウント
    # 'accounts.apps.AccountsConfig', # アカウント
    'employeemas.apps.EmployeemasConfig', # 従業員マスタ
    'storemas.apps.StoremasConfig', # 店舗マスタ
    'itemmas.apps.ItemmasConfig', # 商品マスタ
    'earningmas.apps.EarningmasConfig', # 売上マスタ
    'benchmas.apps.BenchmasConfig', # ベンチマークマスタ
    'bottleneckmas.apps.BottleneckmasConfig', # ボトルネックマスタ
    'stock.apps.StockConfig', # 在庫
    'search.apps.SearchConfig', # 検索
    'reserve.apps.ReserveConfig', # 取置予約
    'estimate.apps.EstimateConfig', # 見積
    'earning.apps.EarningConfig', # 売上
    'employeeref.apps.EmployeerefConfig', # 従業員参照
    'storeref.apps.StorerefConfig', # 店舗参照
    'workstatus.apps.WorkstatusConfig', # 勤務状況参照
    

    # 個人の試しアプリケーション

    # django-allauthに必要なもの
    'django.contrib.sites',
    'allauth',
    'allauth.account',

    # 数字3桁区切りで表示するため
    'django.contrib.humanize',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'sales_information_management.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'sales_information_management.wsgi.application'


# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'sales_information_management',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': 'localhost',
        'PORT': '5432',
    },
    #     'default': {
    #     'ENGINE': 'django.db.backends.postgresql_psycopg2',
    #     'NAME': 'database-1',
    #     'USER': 'postgres',
    #     'PASSWORD': 'SIMUserShin',
    #     'HOST': '34.199.194.170',
    #     'PORT': '5432',
    # },
    # 外部DBに接続するための変数
    # 'otherdb': {
    #     'ENGINE': 'django.db.backends.postgresql_psycopg2',
    #     'NAME': 'SIM',
    #     'USER': 'postgres',
    #     'PASSWORD': 'Postgres',
    #     'HOST': '10.250.2.87',
    #     'PORT': '5432',
    # }
}


# Password validation
# https://docs.djangoproject.com/en/2.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/2.2/topics/i18n/

LANGUAGE_CODE = 'ja'

TIME_ZONE = 'Asia/Tokyo'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.2/howto/static-files/

STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join(BASE_DIR,'static'),
)

# MEDIA_ROOT = MEDIA_DIR
MEDIA_URL = "/media/"

MEDIA_ROOT = os.path.join(BASE_DIR, "media")

# 表示する数値に3桁のカンマ区切りを自動で入れる
NUMBER_GROUPING = 3
USE_THOUSAND_SEPARATOR = True

# ロギング設定
LOGGING = {
    'version': 1,  # 1固定
    'disable_existing_loggers': False,

    # ロガーの設定
    'loggers': {
        # Djangoが利用するロガー
        'django': {
            'handlers': ['console'],
            'level': 'INFO',
        },
        # homeアプリケーションが利用するロガー
        'home': {
            'handlers': ['console'],
            'level': 'DEBUG',
        },
    },

    # ハンドラの設定
    'handlers': {
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'dev'
        },
    },

    # フォーマッタの設定
    'formatters': {
        'dev': {
            'format': '\t'.join([
                '%(asctime)s',
                '[%(levelname)s]',
                '%(pathname)s(Line:%(lineno)d)',
                '%(message)s'
            ])
        },
    }
}

SITE_ID = 1 #django-allauthがsitesフレームワークを使っているため
# AUTHENTICATION_BACKENDS = (
#     'django.contrib.auth.backends.ModelBackend',
#     'allauth.accounts.auth_backends.AuthenticationBackend',
# )

# # 認証方式を「メールアドレスとパスワード」に変更
# # ACCOUNT_AUTHENTICATION_METHOD = 'email'
# # ユーザー名を使用する
# ACCOUNT_USERNAME_REQUIRED = False

# # ユーザー登録確認メールは送信しない
# ACCOUNT_EMAIL_VERIFICATION = 'none'
# # メールアドレスを必須項目にしない
# ACCOUNT_EMAIL_REQUIRED = False

# #ユーザーモデルの拡張(customuser)
# AUTH_USER_MODEL = 'accounts.CustomUser'


# LOGIN_REDIRECT_URL = 'home'
# ACCOUNT_LOGOUT_REDIRECT_URL = '/accounts/login/'
# ACCOUNT_LOGOUT_ON_GET = True

# ACCOUNT_AUTHENTICATION_METHOD = 'employee_id'

# #signupformを指定
# ACCOUNT_FORMS = {
#     'signup' : 'accounts.forms.CustomSignupForm',
# }
# #signupformからの情報をcustomusermodelに保存するのに必要
# ACCOUNT_ADAPTER = 'accounts.adapter.AccountAdapter'
# #passwordの入力を一回に
# ACCOUNT_SIGNUP_PASSWORD_ENTER_TWICE = True